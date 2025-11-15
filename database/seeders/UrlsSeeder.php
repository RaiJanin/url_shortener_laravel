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
                'created_by'   => $row[1] ?? null,
                'link_name'    => $row[2] ?? null,
                'original_url' => $row[3] ?? null,
                'short_code'   => $row[4] ?? null,
                'clicks'       => $row[5] ?? null,
                'expires_at'   => (empty($row[6]) || $row[6] === '?' ? null : $row[6]),
                'created_at'   => $row[7] ?? now(),
                'updated_at'   => $row[8] ?? now(),
            ]);
        }

        fclose($file);
    }
}
