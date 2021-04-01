<?php

use App\Http\Controllers\DashboardController;
use App\Http\Controllers\JurusanController;
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

Route::get('/', [DashboardController::class, 'index'])->name('dashboard');
Route::get('/jurusan', [JurusanController::class, 'index'])->name('jurusan');
Route::get('/jurusan/create', [JurusanController::class, 'create']);
Route::get('/jurusan/{jurusan}/edit', [JurusanController::class, 'edit']);
Route::patch('/jurusan/{jurusan}', [JurusanController::class, 'update']);
Route::delete('/jurusan/{jurusan}', [JurusanController::class, 'destroy']);
Route::post('/jurusan', [JurusanController::class, 'store']);
