<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;

Route::get('/', function () {
    return view('welcome');
});

//-----Web start up
Route::get('/s-app', function () { return redirect()->route('home'); });

//-----Page routes
Route::prefix('/s-app')->group( function () {

    Route::get('home', function () {
        return view('home.index');
    })->name('home');

    Route::get('links', function() {
        return view('layouts.placeholder'); // page not yet implemented, display a blank page
    })->name('links');

    Route::get('account', function() {
        return view('layouts.placeholder'); // page not yet implemented, display a blank page
    })->name('account');
    
});

//------Link redirect under HomeController
Route::get('/{code}', [HomeController::class, "redirectToLink"])->name('url.redirect');