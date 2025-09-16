<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Urls;
use Illuminate\Http\Request;

class UrlListController extends Controller
{
    function clickLogs($code)
    {
        $url = Urls::where('short_code', $code)->firstOrFail();
        if(!$url) {
            abort(404);
        }

        return response()->json([
            'linkName' => $url->link_name,
            'shortUrl' => url('/'). '/'. $url->short_code,
            'link' => $url->original_url,
            'clicks' => $url->clicks
        ]);
    }
}
