<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class UrlClicks extends Model
{
    protected $table = 'url_clicks';

    protected $fillable = ['url_id', 'ip_address', 'user_agent', 'referrer', 'clicked_at'];

    public $timestamps = false;

    public function urls()
    {
        return $this->belongsTo(Urls::class, 'url_id');
    }
}
