<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Auth\ForgotPasswordController;
use App\Http\Controllers\Auth\ResetPasswordController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\Admin\AdminController;
use App\Http\Controllers\Admin\UserController;
use App\Http\Controllers\Admin\TaskController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('auth/login');
});

// Auth::routes();

Route::get('/password/reset', [ForgotPasswordController::class, 'showLinkRequestForm'])->name('password.request');
Route::post('/password/email', [ForgotPasswordController::class, 'sendResetLinkEmail'])->name('password.email');
Route::get('/password/reset/{token}', [ResetPasswordController::class, 'showResetForm'])->name('password.reset');
Route::post('/password/reset', [ResetPasswordController::class, 'reset'])->name('password.update');

Route::get('/home', [HomeController::class, 'index'])->name('home');

Route::post('/admin-login' , [AdminController::class, 'login'])->name('admin-login');
Route::post('/admin-login-submit' ,  [AdminController::class, 'adminLoginSubmit']);
Route::get('/admin-logout' , [AdminController::class, 'logout']);

Route::group(['middleware' => ['admin']], function () {
    Route::controller(AdminController::class)->group(function() {
        Route::get('/dashboard', 'dashboard')->name('dashboard');
        Route::post('/logout', 'logout')->name('logout');
        Route::get('/get-profile', 'getProfile')->name('get-profile');
        Route::get('/edit-profile', 'editProfile')->name('edit-profile');
        Route::post('/update-profile', 'updateProfile')->name('update-profile');
        Route::get('/change-password', 'changePassword')->name('change-password');
        Route::post('/update-password', 'updatePassword')->name('update-password');
    });

    // route for user
    Route::controller(UserController::class)->group(function() {
        Route::get('/list-user' , 'index');
        Route::get('/add-user' , 'create');
        Route::get('/edit-user/{id}' , 'edit');
        Route::post('/save-user' , 'store');
        Route::post('/update-user' , 'update');
        Route::post('/delete-user','destroy');
    });
    
    // route for task
    Route::controller(TaskController::class)->group(function() {
        Route::get('/list-task' , 'index');
        Route::get('/add-task' , 'create');
        Route::get('/edit-task/{id}' , 'edit');
        Route::post('/save-task' , 'store');
        Route::post('/update-task' , 'update');
        Route::post('/delete-task','destroy');
        Route::post('/get-coordinates', 'getCoordinates');
    });

});