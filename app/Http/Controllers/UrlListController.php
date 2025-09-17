<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Urls;
use Illuminate\Http\Request;

class UrlListController extends Controller
{
    public function clickLogs($Id)
    {
        $url = Urls::finfOrFail($Id);
        if(!$url) {
            abort(404);
        }

        return response()->json([
            'linkName' => $url->link_name,
            'shortUrl' => url('/').'/'. $url->short_code,
            'link' => $url->original_url,
            'clicks' => $url->clicks
        ]);
    }

    public function loadAllUrls()
    {
        return response()->json([
            'success' => false,
            'hasData' => false,
            'message' => 'Feature under development'
        ]);
    }
}
