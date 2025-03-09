<?php

use App\Http\Controllers\UsersController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::post('/login', [UsersController::class, 'login']);
Route::post('/register', [UsersController::class, 'register']);
Route::middleware('auth:sanctum')->group(function() {
    Route::get('/user', [UsersController::class, 'index']);
    // Route::post('/fav', [UsersController::class, 'storeFavDoc']);
    // Route::post('/logout', [UsersController::class, 'logout']);
    // Route::post('/book', [AppointmentsController::class, 'store']);
    // Route::post('/reviews', [DocsController::class, 'store']);
    // Route::get('/appointments', [AppointmentsController::class, 'index']);
});