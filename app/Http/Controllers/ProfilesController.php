<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ProfilesController extends Controller
{
    public function updateName(Request $request)
    {
        $user = $request->user();
        dd($user);
    }

    public function updateEmail(Request $request)
    {
        $user = $request->user();
        dd($user);
    }

    public function updatePassword(Request $request)
    {
        $user = $request->user();
        dd($user);
    }

    public function terminate(Request $request)
    {
        $user = $request->user();
        dd($user);
    }

}
