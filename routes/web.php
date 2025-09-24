<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\UrlListController;

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
        return view('links.index');
    })->name('links');

    Route::get('account', function() {
        return view('layouts.placeholder'); // page not yet implemented, display a blank page
       //return view('account.index');
    })->name('account');
    
});

//------Link Logs
Route::get('/s-app/logs', [UrlListController::class, "clickLogs"])->name('url.logs');

//-------Show logs page without query
Route::get('/s-app/logs-no-query', function () {
    return view('ui.click_logs');
});

//------Link redirect under HomeController
Route::get('/{code}', [HomeController::class, "redirectToLink"])->name('url.redirect');