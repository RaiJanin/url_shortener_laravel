<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\UrlListController;
use App\Http\Controllers\AuthController;

Route::get('/login', [AuthController::class, 'showLogin'])->name('login');
Route::post('/login', [AuthController::class, 'login'])->name('user.login');
Route::get('/register', [AuthController::class, 'showRegister'])->name('register');
Route::post('/register', [AuthController::class, 'register'])->name('user.register');
Route::post('/logout', [AuthController::class, 'logout'])->name('logout');

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
    })->name('links')->middleware('auth');

    Route::get('account', function() {
       return view('account.index');
    })->name('account')->middleware('auth');
    
});

//------Link Logs
Route::get('/s-app/logs', [UrlListController::class, "clickLogs"])->name('url.logs')->middleware('auth');

//------Link redirect under HomeController
Route::get('/{code}', [HomeController::class, "redirectToLink"])->name('url.redirect');