<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class UrlClicks extends Model
{
    protected $table = 'url_clicks';

    public function urls()
    {
        return $this->belongsTo(Urls::class, 'url_id');
    }
}
