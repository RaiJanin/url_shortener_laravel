<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Urls;
use App\Models\UrlClicks;
use Illuminate\Http\Request;
use App\Services\IdentifierService;

use DateTime;
use DateTimeZone;
use Illuminate\Support\Js;

class UrlListController extends Controller
{
    public function linkDetails($Id)
    {
        $url = Urls::findOrFail($Id);
        if(!$url) {
            abort(404);
        }

        return response()->json([
            'success' => true,
            'id' => $url->id,
            'linkName' => $url->link_name,
            'shortUrl' => url($url->short_code),
            'link' => $url->original_url,
            'clicks' => $url->clicks,
            'expiryDate' => $url->expires_at,
            'dateCreated' => $url->created_at
        ]);
    }

    public function clickLogs(Request $request)
    {
        $request->validate([
            'url_id' => 'required|exists:url_codes,id',
            'range' => 'nullable|in:7,14,30,60,120,360,all',
        ]);

        $linkData = Urls::with('clickLogs')->findOrFail($request->url_id);
        $range = $request->range ?? 7;

        if($range === 'all')
        {
            $range = null;
        }

        $ClickLgquery = $linkData->filterDateLogs($range);
        $clickLogs = $ClickLgquery->get();

        $totalClicks = $clickLogs->count();
        $todayClicks = $clickLogs->filter(fn($log) => \Carbon\Carbon::parse($log->clicked_at)->isToday())->count();

        if($totalClicks == 0)
        {
            $hasClickLogs = false;
            $message = 'No click logs yet';
        }
        else
        {
            $hasClickLogs = true;
            $message = 'Click logs found';
        }

        $logData = $clickLogs->map(function ($log) {
            $ua  = IdentifierService::parseUserAgent($log->user_agent);
            $ref = IdentifierService::parseReferrer($log->referrer);
            $loc = IdentifierService::getLocation($log->ip_address);

            return [
                'clickedAt'   => $log->clicked_at,
                'device'       => $ua['device'],
                'deviceType'  => $ua['os'],
                'source'       => $ua['browser'],
                'location'     => $loc,
                'referrer'     => $ref
            ];
        });

        $logDataLim = $logData->sortByDesc('clickedAt')->take(50)->values();

        $dailyClicks = $ClickLgquery->selectRaw('DATE(clicked_at) as clickDate, COUNT(*) as dayTotal')->groupBy('clickDate')->orderByDesc('clickDate')->get();

        return view('ui.click-logs', [
            'hasClickLogs' => $hasClickLogs,
            'message' => $message,
            'totalClicks' => $totalClicks,
            'todayClicks' => $todayClicks,
            'linkName' => $linkData->link_name,
            'OrigLink' => $linkData->original_url,
            'shortUrl' => url($linkData->short_code),
            'linkCreated' => $linkData->created_at->format('F j, Y'),
            'expiryDate' => $linkData->expires_at ?  $linkData->expires_at->format('F j, Y') : 'Never',
            'clickLogs' => $logDataLim,
            'LogsCount' => $logDataLim->count(),
            'dailyClicks' => $dailyClicks,
            'deviceStats' => $logData->groupBy('deviceType')->map->count(),
            'geoStats' => $logData->groupBy('location')->map->count(),
            'refferStats' => $logData->groupBy('referrer')->map->count(),
            'filters' => [
                'range' => $request->range ?? null
            ]
        ]);
    }

    public function loadAllUrls(Request $request)
    {
        $searchVal = $request->input('search', '');
        $sortVal = $request->input('sort', 'newest');

        $query = Urls::query();

        if($searchVal !== '')
        {
            $query->where('link_name', 'like', "%{$searchVal}%")->orWhere('original_url', 'like', "%{$searchVal}%");
        }

        switch($sortVal)
        {
            case 'oldest':
                $query->orderBy('created_at', 'ASC');
                break;
            case 'clicks':
                $query->orderBy('clicks', 'DESC');
                break;
            default:
                $query->orderBy('created_at', 'DESC');
                break;
        }

        $data = $query->paginate(6);

        if($data->count() == 0) 
        {
            return response()->json([
                'success' => false,
                'hasData' => false,
                'message' => 'No data found'
            ]);
        }

        $l = $data->getCollection()->map(function ($row) {

            $expireWarn = false;
            
            if(!$row->expires_at == null) 
            {
                $now = new DateTime();
                $dateLimit = (clone $now)->modify('+3 days');
                $expiryDate = new DateTime($row->expires_at);

                if($expiryDate >= $now && $expiryDate <= $dateLimit) 
                {
                    $expireWarn = true;
                }
            }

            return [
                'id' => $row->id,
                'urlName' => $row->link_name,
                'longUrl' => $row->original_url,
                'shortUrl' => url($row->short_code),
                'clicks' => $row->clicks,
                'expiresAt' => $row->expires_at,
                'expireWarning' => $expireWarn
            ];
        });

        $totalUrls = Urls::count() ?? 0;
        $totalClicks = Urls::sum('clicks') ?? 0;
        $todayClicks = UrlClicks::whereDate('clicked_at', today())->count() ?? 0;
        $expiringSoon = Urls::whereNotNull('expires_at')->where('expires_at', '<', now()->addDays(3))->count() ?? 0;

        return response()->json([
            'success' => true,
            'hasData' => true,
            'data' => $l,
            'stats'=> [
                'totalUrls' => $totalUrls,
                'totalClicks' => $totalClicks,
                'clicksToday' => $todayClicks,
                'expiringSoon' => $expiringSoon,
            ],
            'page' => $data->currentPage(),
            'totalPages' => $data->lastPage(),
            'perPage' => $data->perPage(),
            'total' => $data->total(),
            'message' => 'Data loaded successfully'
        ]);
    }

    public function urlUpdatePreview($updateId)
    {
        $show = Urls::select('id', 'link_name', 'short_code', 'original_url')->find($updateId);

        if(!$show)
        {
            return response()->json([
                'success' => false,
                'message' => 'Url not found',
                'id' => $updateId
            ]);
        }

        return response()->json([
            'success' => true,
            'id' => $show->id,
            'linkName' => $show->link_name,
            'shortCode' => $show->short_code,
            'urlDomain' => url('/'),
            'longUrl' => $show->original_url,
            'shortUrl' => url($show->short_code)
        ]);
    }

    public function updateUrl(Request $request, $eID) {
        
        $url = Urls::find($eID);

        if(!$url)
        {
            return response()->json([
                'success' => false,
                'message' => 'Url Not Found on the Server'
            ], 404);
        }

        $request->validate([
            'linkNameUp' => 'required|string',
            'backHalfUp' => 'required|max:6'
        ]);

        $url->link_name = $request->linkNameUp;
        $url->short_code = $request->backHalfUp;
        $url->save();

        return response()->json([
            'success' => true,
            'message' => 'URL Updated Successfully'
        ]);
    }

    public function deleteUrl($dID)
    {
        Urls::find($dID)->delete();

        return response()->json([
            'success' => true,
            'message' => 'URL Deleted Successfully'
        ], 200);
    }
}
