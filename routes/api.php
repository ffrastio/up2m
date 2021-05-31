<?php

use App\Http\Controllers\API\APIController;
use App\Http\Controllers\API\AuthController;
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

Route::post('login', 'AuthController@login');

//penelitian
Route::get('list-penelitian', [APIController::class, 'getAllPenelitian']);
Route::get('penelitian/{id}', [APIController::class, 'getPenelitian']);
Route::get('penelitian', [APIController::class, 'getPenelitianByTahun']);

//pengabdian
Route::get('list-pengabdian', [APIController::class, 'getAllPengabdian']);
Route::get('pengabdian/{id}', [APIController::class, 'getPengabdian']);
Route::get('pengabdian', [APIController::class, 'getPengabdianByTahun']);

//jurusan
Route::get('list-jurusan', [APIController::class, 'getAllJurusan']);

Route::group(['prefix' => 'auth', 'middleware' => 'auth:sanctum'], function () {

    // manggil controller sesuai bawaan laravel 8
    Route::post('logout', [AuthController::class, 'logout']);
    // manggil controller dengan mengubah namespace di RouteServiceProvider.php biar bisa kayak versi2 sebelumnya
    Route::post('logoutall', 'AuthController@logoutall');
});
