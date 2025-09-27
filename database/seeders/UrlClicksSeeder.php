<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class UrlClicksSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $path = database_path('seeders/data/url_clicks-url_stn.csv');
        $file = fopen($path, 'r');

        $csvContent = file_get_contents($path);
        $csvContent = preg_replace('/^\xEF\xBB\xBF/', '', $csvContent);
        file_put_contents($path, $csvContent);

        while (($row = fgetcsv($file, 1000, ',')) !== false) {
            
            $urlExists = DB::table('url_codes')->where('id', $row[1])->exists();

            if ($urlExists) {
                DB::table('url_clicks')->insert([
                    'id'         => $row[0],
                    'url_id'     => $row[1],
                    'ip_address' => $row[2],
                    'user_agent' => $row[3],
                    'referrer'   => $row[4],
                    'clicked_at' => $row[5] ?: now(),
                ]);
            } else {
                $this->command->warn("Skipping click log with url_id={$row[1]} (URL not found)");
            }
        }

        fclose($file);
    }
}
