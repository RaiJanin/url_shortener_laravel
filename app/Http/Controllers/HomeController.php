<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Urls;

class HomeController extends Controller
{
    public function createShortUrl(Request $request) 
    {
        $request->validate([
            'lngrl' => 'required|url',
            'nmRl' => 'nullable|string',
            'cstlias' => 'nullable|string',
            'expy' => 'nullable|in:none,1d,7d,30d'
        ]);

        $longUrl = $request->lngrl;
        $url = Urls::where('original_url', $longUrl)->first();

        if(!$url) 
        {
            if($request->filled('cstlias')) 
            {
                if (strlen($request->cstlias) !== 6) 
                {
                    return response()->json([
                        'success' => false,
                        'message' => 'Custom alias must be exactly 6 characters.',
                    ], 422);
                }
                
                $shortCode = $request->cstlias;

                if(Urls::where('short_code', $shortCode)->exists()) 
                {
                    return response()->json([
                        'success' => false,
                        'message' => 'This alias is already taken. Create a unique one.'
                    ], 422);
                }
            } 
            else 
            {
                do 
                {
                    $shortCode = Urls::generateCode();
                }
                while(Urls::where('short_code', $shortCode)->exists());
            }

            if($request->input('nmRl')) 
            {
                $linkName = $request->nmRl;
            } 
            else 
            {
                $linkName = str_replace('www.', '', parse_url($longUrl, PHP_URL_HOST));
            }

            switch($request->expy) 
            {
                case '1d':
                    $expiryDate = now()->addDay();
                    break;
                case '7d':
                    $expiryDate = now()->addDays(7);
                    break;
                case '30d':
                    $expiryDate = now()->addDays(30);
                    break;
                case 'none':
                    $expiryDate = null;
                    break;
                default:
                    return response()->json([
                        'success' => false,
                        'message' => 'Invalid date selection'
                    ]);
                    return;
                    break;
            }

            $url = new Urls();
            $url->original_url = $longUrl;
            $url->link_name = $linkName;
            $url->short_code = $shortCode;
            $url->clicks = 0;
            $url->expires_at = $expiryDate;
            $url->save();

            return response()->json([
                'success' => true,
                'shortUrl' => url($shortCode),  //url('/').'/'.$shortCode,
                'originalUrl' => $longUrl,
                'linkName' => $linkName 
            ]);
        } 
        else 
        {
            return response()->json([
                'success' => false,
                'message' => 'Url already exists.'
            ]);
        }
    }

    public function savedUrls() 
    {
        Urls::whereNotNull('expires_at')->where('expires_at', '<', now())->delete();

        $urls = Urls::orderBy('id', 'desc')->paginate(8);

        $data = $urls->map(function ($row) {
            return [
                'id' => $row->id,
                'urlName' => $row->link_name,
                'longUrl' => $row->original_url,
                'shortUrl' => url('/') . '/' . $row->short_code,
            ];
        });

        if($urls->count() == 0) 
        {
            return response()->json([
                'success' => true,
                'hasData' => false,
                'message' => 'No Data Found'
            ]);
        } 
        else 
        {
            return response()->json([
                'success' => true,
                'hasData'=> true,
                'data' => $data,
                'page' => $urls->currentPage(),
                'perPage' => $urls->perPage(),
                'total' => $urls->total(),
                'totalPages' => $urls->lastPage(),
                'message' => 'URLs loaded successfully',
            ]);
        }
    }

    function redirectToLink ($code) 
    {
        $url = Urls::where('short_code', $code)->first();
        if(!$url) {
            return view('error.index');
        }
        $url->increment('clicks');
        return redirect($url->original_url);
    }
}
