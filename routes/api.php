<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
Route::prefix('app')->group(function(){
    Route::post('/otp',[AuthController::class,'otp']);
    Route::post('/register',[AuthController::class,'register']);
    Route::post('/login',[AuthController::class,'login']);
    Route::post('/master',[AuthController::class,'otpValidate']);
});

// Auth Routes
Route::middleware('auth:api')->prefix('admin')->group(function(){
    Route::get('/user', [UserController::class,'show']);
    Route::post('/logout',[AuthController::class,'logout']);
});

// Current User
Route::middleware('auth:api')->get('/me', function (Request $request) {
    return $request->user();
});

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });
