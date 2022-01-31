<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\DealsController;
use App\Http\Controllers\RestaurentController;
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
    Route::post('/restaurent_register',[AuthController::class,'otpValidate']);
    Route::get('/check-mail/{email}',[UserController::class,'checkUniqueMail']);
});

// Auth Routes
Route::middleware('auth:api')->prefix('admin')->group(function(){
    Route::get('/user', [UserController::class,'show']);
    Route::post('/user_edit/{id}',[UserController::class,'edit']);
    Route::get('/my_data', [AuthController::class,'currentUserData']);
    Route::post('/logout',[AuthController::class,'logout']);
    Route::post('/restaurent_register',[RestaurentController::class,'store']);
    Route::get('/restaurents/{cors}',[RestaurentController::class,'showAll']);
    Route::post('/restaurent_edit/{id}',[RestaurentController::class,'update']);
    Route::get('/restaurents/{id}',[RestaurentController::class,'showOne']);
    Route::post('/deal_add',[DealsController::class,'store']);
    Route::get('/deals',[DealsController::class,'show']);
    Route::post('/deals_edit/{id}',[DealsController::class,'update']);
});

// Current User
// Route::middleware('auth:api')->get('/me', function (Request $request) {
//     return $request->user();
// });

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });
