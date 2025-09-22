<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\UrlListController;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

//----- Home Controllers
Route::post('/crteCod', [HomeController::class, "createShortUrl"])->name('url.createLink');
Route::get('/svdf', [HomeController::class, "savedUrls"])->name('url.savedUrls');

//------ UrlListController
Route::get('/logs/{id}', [UrlListController::class, "clickLogs"]);
Route::get('/aLu', [UrlListController::class, "loadAllUrls"])->name('url.loadAll');
Route::get('/uUprev/{id}', [UrlListController::class, "urlUpdatePreview"]);
