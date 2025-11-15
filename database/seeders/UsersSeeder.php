<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Foundation\Auth\User;
use Illuminate\Support\Facades\Hash;

class UsersSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        User::create([
            'uuid' => '36d7a03d-3a75-4999-a7d6-8fa8cf832c03', //strict uuid because url seeder had uuid
            'name' => 'Janino (Right Apps Tech Support)',
            'email' => 'rai.janinoabrenica@gmail.com',
            'password' => Hash::make('Rightech')
        ]);
    }
}
