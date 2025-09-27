<?php

namespace App\Services;

use Illuminate\Support\Str;

class IdentifierService
{
    /**
     * Create a new class instance.
     */
    public function __construct()
    {
        //
    }

    static public function parseUserAgent($ua) 
    {
        $device = 'Unknown';
        $os = 'Unknown';
        $browser = 'Unknown';

        $uaLower = strtolower($ua);

        // --- 1. Bots & Crawlers ---
        $bots = [
            'facebookexternalhit' => 'Facebook Crawler',
            'facebot'             => 'Facebook Bot',
            'twitterbot'          => 'Twitter Bot',
            'linkedinbot'         => 'LinkedIn Bot',
            'pinterestbot'        => 'Pinterest Bot',
            'redditbot'           => 'Reddit Bot',
            'slackbot'            => 'Slack Bot',
            'discordbot'          => 'Discord Bot',
            'telegrambot'         => 'Telegram Bot',
            'googlebot'           => 'Googlebot',
            'bingbot'             => 'Bingbot',
            'duckduckbot'         => 'DuckDuckGo Bot',
            'yandexbot'           => 'Yandex Bot',
            'baiduspider'         => 'Baidu Spider',
            'ahrefsbot'           => 'Ahrefs Bot',
            'semrushbot'          => 'Semrush Bot'
        ];
        foreach ($bots as $key => $label) {
            if (Str::contains($uaLower, $key) !== false) {
                return [
                    'device' => 'Bot',
                    'os' => 'Crawler',
                    'browser' => $label
                ];
            }
        }

        // --- 2. Device Detection ---
        if (preg_match('/mobile/i', $ua)) {
            $device = 'Mobile';
        } elseif (preg_match('/tablet/i', $ua) || Str::contains($uaLower, 'ipad') !== false) {
            $device = 'Tablet';
        } elseif (Str::contains($uaLower, 'smarttv') !== false || Str::contains($uaLower, 'playstation') !== false || Str::contains($uaLower, 'xbox') !== false) {
            $device = 'SmartTV/Console';
        } else {
            $device = 'Desktop';
        }

        // --- 3. OS Detection ---
        if (preg_match('/android\s?([0-9\.]*)/i', $ua, $m)) {
            $os = "Android " . ($m[1] ?: '');
        } elseif (preg_match('/iphone|ipod/i', $ua)) {
            $os = "iOS";
        } elseif (preg_match('/ipad/i', $ua)) {
            $os = "iPadOS";
        } elseif (preg_match('/windows nt 10/i', $ua)) {
            $os = "Windows 10";
        } elseif (preg_match('/windows nt 6\.3/i', $ua)) {
            $os = "Windows 8.1";
        } elseif (preg_match('/windows nt 6\.2/i', $ua)) {
            $os = "Windows 8";
        } elseif (preg_match('/windows nt 6\.1/i', $ua)) {
            $os = "Windows 7";
        } elseif (preg_match('/windows/i', $ua)) {
            $os = "Windows";
        } elseif (preg_match('/mac os x/i', $ua)) {
            $os = "MacOS";
        } elseif (preg_match('/linux/i', $ua)) {
            $os = "Linux";
        }

        // --- 4. Browser & In-App Apps ---
        if (Str::contains($ua, 'FB_IAB') !== false || Str::contains($uaLower, 'fban/messenger') !== false) {
            $browser = 'Facebook/Messenger In-App';
        } elseif (Str::contains($uaLower, 'instagram') !== false) {
            $browser = 'Instagram In-App';
        } elseif (Str::contains($uaLower, 'whatsapp') !== false) {
            $browser = 'WhatsApp In-App';
        } elseif (Str::contains($uaLower, 'telegram') !== false) {
            $browser = 'Telegram In-App';
        } elseif (Str::contains($uaLower, 'line') !== false) {
            $browser = 'Line App';
        } elseif (Str::contains($uaLower, 'viber') !== false) {
            $browser = 'Viber App';
        } elseif (Str::contains($uaLower, 'snapchat') !== false) {
            $browser = 'Snapchat App';
        } elseif (Str::contains($uaLower, 'tiktok') !== false || Str::contains($uaLower, 'musical.ly') !== false) {
            $browser = 'TikTok In-App';
        } elseif (Str::contains($uaLower, 'wechat') !== false) {
            $browser = 'WeChat App';
        } elseif (preg_match('/edg/i', $ua)) {
            $browser = 'Edge';
        } elseif (preg_match('/firefox/i', $ua)) {
            $browser = 'Firefox';
        } elseif (preg_match('/opr/i', $ua) || preg_match('/opera/i', $ua)) {
            $browser = 'Opera';
        } elseif (preg_match('/chrome/i', $ua) && !preg_match('/edg/i', $ua)) {
            $browser = 'Chrome';
        } elseif (preg_match('/safari/i', $ua) && !preg_match('/chrome/i', $ua)) {
            $browser = 'Safari';
        }

        return [
            'device' => $device,
            'os' => $os,
            'browser' => $browser
        ];
    }

    static public function parseReferrer($ref) {
        if (empty($ref) || strtolower($ref) === "direct") {
            return "Direct";
        }

        $map = [
            'google.' => 'Google',
            'bing.com' => 'Bing',
            'yahoo.com' => 'Yahoo',
            'duckduckgo.com' => 'DuckDuckGo',
            'facebook.com' => 'Facebook',
            'fb.com' => 'Facebook',
            'messenger.com' => 'Messenger',
            'm.me' => 'Messenger',
            'instagram.com' => 'Instagram',
            't.co' => 'Twitter/X',
            'twitter.com' => 'Twitter/X',
            'wa.me' => 'WhatsApp',
            'whatsapp.com' => 'WhatsApp',
            't.me' => 'Telegram',
            'telegram.org' => 'Telegram',
            'linkedin.com' => 'LinkedIn',
            'reddit.com' => 'Reddit',
            'youtube.com' => 'YouTube',
            'youtu.be' => 'YouTube',
            'tiktok.com' => 'TikTok',
            'pinterest.com' => 'Pinterest',
            'viber.com' => 'Viber',
            'snapchat.com' => 'Snapchat'
        ];

        foreach ($map as $needle => $source) {
            if (stripos($ref, $needle) !== false) {
                return $source;
            }
        }

        $host = parse_url($ref, PHP_URL_HOST);
        return $host ?: "Unknown";
    }

    static public function getLocation($ip) {
        if ($ip === "127.0.0.1" || $ip === "::1") {
            return "Localhost";
        }

        $url = "http://ip-api.com/json/{$ip}";
        $response = @file_get_contents($url);
        if ($response) {
            $data = json_decode($response, true);
            if ($data['status'] === 'success') {
                return $data['city'] . ", " . $data['country'];
            }
        }
        return "Unknown";
    }
}
