<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\API\UserController;
use App\Http\Controllers\API\VerificationController;
use App\Http\Controllers\API\TaskController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

// Public routes of authtication
Route::controller(UserController::class)->group(function(){
    Route::post('user-register', 'register');
    Route::post('user-login', 'login');
    Route::post('forgot-password', 'forgotPassword');
    Route::post('reset-password', 'resetPassword');
});

Route::get('email/verify/{id}', [VerificationController::class, 'verify'])->name('verification.verify');
Route::get('email/resend', [VerificationController::class, 'resend'])->name('verification.resend');

// Protected routes
Route::middleware('auth:sanctum')->group( function () {
    Route::post('/user-logout', [UserController::class, 'logout']);
    Route::post('/update-profile', [UserController::class, 'updateProfile']);
    Route::get('/get-my-profile', [UserController::class, 'getMyProfile']);
    
    // route for task
    Route::controller(TaskController::class)->group(function() {
        Route::get('/get-all-tasks' , 'getAllTasks');
        Route::post('/get-task-detail' , 'getTaskDetail');
        Route::post('/accept-or-complete-task' , 'acceptOrCompleteTask');
    });
});
