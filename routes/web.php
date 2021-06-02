<?php

use App\Http\Controllers\AuthorController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\JurusanController;
use App\Http\Controllers\PenelitianController;
use App\Http\Controllers\PengabdianController;
use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('auth.login');
});

Route::group(['middleware' => ['auth:sanctum', 'verified']], function () {
    //Route::view('/dashboard', "dashboard")->name('dashboard');

    Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');

    Route::get('/user', [UserController::class, 'index'])->name('user');
    Route::get('/user/create', [UserController::class, 'create']);
    Route::get('/user/{user}/edit', [UserController::class, 'edit']);
    Route::patch('/user/{user}', [UserController::class, 'update']);
    Route::delete('/user/{user}', [UserController::class, 'destroy']);
    Route::post('/user', [UserController::class, 'store']);

    // Route::get('/password', [UserController::class, 'editpass'])->name('password.edit');
    // Route::patch('/password', [UserController::class, 'updatepass'])->name('password.update');

    Route::get('/jurusan', [JurusanController::class, 'index'])->name('jurusan');
    Route::get('/jurusan/create', [JurusanController::class, 'create']);
    Route::get('/jurusan/{jurusan}', [JurusanController::class, 'show']);
    Route::get('/jurusan/{jurusan}/edit', [JurusanController::class, 'edit']);
    Route::patch('/jurusan/{jurusan}', [JurusanController::class, 'update']);
    Route::delete('/jurusan/{jurusan}', [JurusanController::class, 'destroy']);
    Route::post('/jurusan', [JurusanController::class, 'store']);

    Route::get('/author', [AuthorController::class, 'index'])->name('author');
    Route::get('/author/create', [AuthorController::class, 'create']);
    Route::get('/author/{author}/edit', [AuthorController::class, 'edit']);
    Route::patch('/author/{author}', [AuthorController::class, 'update']);
    Route::delete('/author/{author}', [AuthorController::class, 'destroy']);
    Route::post('/author', [AuthorController::class, 'store']);

    Route::get('/penelitian', [PenelitianController::class, 'index'])->name('penelitian');
    Route::post('/penelitian/import', [PenelitianController::class, 'import']);

    Route::get('/pengabdian', [PengabdianController::class, 'index'])->name('pengabdian');
    Route::post('/pengabdian/import', [PengabdianController::class, 'import']);
});
