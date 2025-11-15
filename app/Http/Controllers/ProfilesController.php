<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class ProfilesController extends Controller
{
    public function updateName(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255'
        ]);

        $user = $request->user();
        
        $user->name = $request->name;
        $user->save();

        return redirect()->back()->with('success', 'Name Updated Successfully');
    }

    public function updateEmail(Request $request)
    {
        $request->validate([
            'newEmail' => 'required|email|unique:users,email',
            'confirmEmail' => 'required|same:newEmail',
            'emailPassword' => 'required'
        ]);

        $user = $request->user();

        if(!Hash::check($request->emailPassword, $user->password))
        {
            return back()->withErrors(['emailPassword' =>'Incorrect Password']);
        }

        $user->email = $request->newEmail;
        $user->save();

        return redirect()->back()->with('success', 'Email Updated Successfully');
    }

    public function updatePassword(Request $request)
    {
        $request->validate([
            'currentPassword' => 'required',
            'newPassword' => 'required',
            'confirmPassword' => 'required|same:newPassword'
        ]);

        $user = $request->user();

        if(!Hash::check($request->currentPassword, $user->password))
        {
            return back()->withErrors(['currentPassword' =>'Incorrect Current Password']);
        }

        $newPass = Hash::make($request->newPassword);

        $user->password = $newPass;
        $user->save();

        return redirect()->back()->with('success', 'Password Updated Successfully');
    }

    public function terminate(Request $request)
    {
        //$user = $request->user();
        return view('layouts.placeholder');
    }

}
