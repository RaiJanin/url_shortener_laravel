<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

use function PHPUnit\Framework\isNumeric;

class Urls extends Model
{
    protected $table = 'url_codes';

    protected $fillable = ['link_name', 'original_url', 'short_code', 'clicks', 'expires_at'];

    protected $casts = [
        'created_at' => 'datetime',
        'expires_at' => 'datetime',
        'updated_at' => 'datetime'
    ];

    public function clickLogs()
    {
        return $this->hasMany(UrlClicks::class, 'url_id');
    }

    public function filterDateLogs($range = 7)
    {
        return $this->clickLogs()
            ->when($range, function($qu) use ($range) {
                return $qu->where('clicked_at', '>=', now()->subDays($range));
            });
    }

    public static function generateCode() 
    {
        $length = 6;
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $randomStr = '';
        for ($i = 0; $i < $length; $i++) {
            $randomStr .= $characters[random_int(0, strlen($characters) - 1)];
        }
        return $randomStr;
    }
}
