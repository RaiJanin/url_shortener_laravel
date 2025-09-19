<?php
/* THIS IS NOT A LIVE CONTROLLER, ONLY FOR REFERENCES
*/
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Services\IdentifierService;

class UrlController extends Controller
{
    public function show(Request $request)
    {
        $id = $request->input('urlId');

        if (!$id || $id == 0) {
            return response()->json([
                'success' => false,
                'message' => 'Invalid Url'
            ]);
        }

        // get url details
        $linkDetails = DB::table('url_codes')
            ->select('url_name', 'long_url', 'short_code', 'clicks', 'created_at', 'expires_at')
            ->where('id', $id)
            ->first();

        if (!$linkDetails) {
            return response()->json([
                'success' => false,
                'message' => 'URL not found'
            ]);
        }

        $linkDetails->short_url = url($linkDetails->short_code);

        // click logs
        $clickLogs = DB::table('url_clicks')->where('url_id', $id)->get();

        if ($clickLogs->isEmpty()) {
            return response()->json([
                'success' => true,
                'has_click_logs' => false,
                'message' => 'No Click Logs',
                'url_id' => $id,
                'link_details' => $linkDetails
            ]);
        }

        $linkData = [];
        foreach ($clickLogs as $log) {
            $ua  = IdentifierService::parseUserAgent($log->user_agent);
            $ref = IdentifierService::parseReferrer($log->referrer);
            $loc = IdentifierService::getLocation($log->ip_address);

            $linkData[] = [
                'clicked_at'   => $log->clicked_at,
                'device'       => $ua['device'],
                'device_type'  => $ua['os'],
                'source'       => $ua['browser'],
                'location'     => $loc,
                'referrer'     => $ref
            ];
        }

        // stats
        $totalClicks = DB::table('url_clicks')
            ->where('url_id', $id)
            ->count();

        $dailyClicks = DB::table('url_clicks')
            ->selectRaw('DATE(clicked_at) as click_date, COUNT(*) as day_total')
            ->where('url_id', $id)
            ->groupBy('click_date')
            ->orderByDesc('click_date')
            ->get();

        return response()->json([
            'success'       => true,
            'has_click_logs'=> true,
            'url_id'        => $id,
            'link_details'  => $linkDetails,
            'link_data'     => $linkData,
            'total_clicks'  => $totalClicks,
            'daily_clicks'  => $dailyClicks
        ]);
    }
}
