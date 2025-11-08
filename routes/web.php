<?php

require __DIR__.'/auth.php';

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\UrlListController;
use App\Http\Controllers\ProfilesController;

Route::get('/', function () {
    return view('land');
});

//-----Web start up
Route::get('/s-app', function () { return redirect()->route('home'); });

//-----Page routes
Route::prefix('/s-app')->group( function () {

    Route::get('/home', function () {
        return view('home.index');
    })->name('home');

    //------Protected page routes
    Route::middleware('auth')->group( function () {

        Route::get('/links', function() {
            return view('links.index');
        })->name('links');

        Route::get('/account', function() {
            return redirect()->to('/s-app/account/profile');
        });

        Route::get('/account/{section?}', function() {
            return view('account.index');
        })->name('account');

        //------Link Logs
        Route::get('/logs', [UrlListController::class, "clickLogs"])
            ->name('url.logs');

    });

    //--------Protected profile management routes
    Route::middleware('auth')->group(function () {
        
        //--------ProfilesController
        Route::patch('/name-update', [ProfilesController::class, "updateName"])
            ->name('user.nameUpdate');
        Route::patch('/email-update', [ProfilesController::class, "updateEmail"])
            ->name('user.emailUpdate');
        Route::patch('/new-pass', [ProfilesController::class, "updatePassword"])
            ->name('user.newPass');
        Route::delete('/terM34fdr', [ProfilesController::class, "terminate"])
            ->name('terminate');

    });

});

//------Link redirect under HomeController
Route::get('/{code}', [HomeController::class, "redirectToLink"])->name('url.redirect');