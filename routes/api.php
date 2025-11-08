<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\UrlListController;

Route::middleware(['web', 'auth:sanctum'])->group(function () {
    Route::get('/user', function (Request $request) {
        return $request->user();
    });

    Route::get('/userJson', function (Request $request) {
        return response()->json($request->user());
    })->name('json.user');

    //----- Home Controllers
    Route::post('/crteCod', [HomeController::class, "createShortUrl"])
        ->name('url.createLink');
    Route::get('/svdf', [HomeController::class, "savedUrls"])
        ->name('url.savedUrls');

    //------ UrlListController
    Route::get('/lDetails/{id}', [UrlListController::class, "linkDetails"]);
    Route::get('/aLu', [UrlListController::class, "loadAllUrls"])->name('url.loadAll');
    Route::get('/uUprev/{id}', [UrlListController::class, "urlUpdatePreview"]);
    Route::put('/uUpdate/{id}', [UrlListController::class, "updateUrl"]);
    Route::delete('/delURL/{id}', [UrlListController::class, "deleteUrl"]);

});
