<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Urls extends Model
{
    protected $table = 'url_codes';

    protected $fillable = ['link_name', 'original_url', 'short_code', 'clicks', 'expires_at'];

    public function clicks()
    {
        return $this->hasMany(UrlClicks::class, 'url_id');
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
