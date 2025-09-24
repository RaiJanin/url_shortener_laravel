<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Urls;
use App\Models\UrlClicks;
use Illuminate\Http\Request;
use App\Services\IdentifierService;

use DateTime;

class UrlListController extends Controller
{
    public function linkDetails($Id)
    {
        $url = Urls::findOrFail($Id);
        if(!$url) {
            abort(404);
        }

        if(Urls::where('clicks')->count() == 0)
        {
            $hasClickLogs = false;
        }
        else
        {
            $hasClickLogs = true;
        }

        return response()->json([
            'success' => true,
            'hasClickLogs' => $hasClickLogs,
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
        $linkData = Urls::with('clickLogs')->findOrFail($request->url_id);

        $totalClicks = UrlClicks::where('url_id', $request->url_id)->count() ?? 0;
        $todayClicks = UrlClicks::where('url_id', $request->url_id)->whereDate('clicked_at', now())->count() ?? 0;

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

        $clickLogs = $linkData->clickLogs;

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

        $dailyClicks = UrlClicks::selectRaw('DATE(clicked_at) as clickDate, COUNT(*) as dayTotal')->where('url_id', $request->url_id)->groupBy('clickDate')->orderByDesc('clickDate')->get();

        return response()->json([
            'success' => true,
            'hasClickLogs' => $hasClickLogs,
            'message' => $message,
            'totalClicks' => $totalClicks,
            'todayClicks' => $todayClicks,
            'linkName' => $linkData->link_name,
            'OrigLink' => $linkData->original_url,
            'shortUrl' => url($linkData->short_code),
            'linkCreated' => $linkData->created_at,
            'expiryDate' => $linkData->expires_at ?? 'Never',
            'clickLogs' => $logData,
            'dailyClicks' => $dailyClicks
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
}
