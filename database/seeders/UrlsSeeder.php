<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class UrlsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $path = database_path('seeders/data/url_codes-url_stn.csv');
        $file = fopen($path, 'r');
        
        $csvContent = file_get_contents($path);
        $csvContent = preg_replace('/^\xEF\xBB\xBF/', '', $csvContent);
        file_put_contents($path, $csvContent);

        
        while (($row = fgetcsv($file, 1000, ',')) !== false) {
            DB::table('url_codes')->insert([
                'id'           => $row[0],
                'link_name'    => $row[1],
                'original_url' => $row[2],
                'short_code'   => $row[3],
                'clicks'       => $row[4],
                'expires_at'   => (empty($row[5]) || $row[5] === '?' ? null : $row[5]),
                'created_at'   => $row[6] ?: now(),
                'updated_at'   => $row[7] ?: now(),
            ]);
        }

        fclose($file);
    }
}
