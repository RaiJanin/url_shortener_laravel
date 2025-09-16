<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Urls extends Model
{
    protected $table = 'url_codes';

    public static function generateCode() {
        $length = 6;
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $randomStr = '';
        for ($i = 0; $i < $length; $i++) {
            $randomStr .= $characters[random_int(0, strlen($characters) - 1)];
        }
        return $randomStr;
    }
}
