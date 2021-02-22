<?php

use Illuminate\Http\Request;

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

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('arsip','ArsipController@index');
Route::post('arsip','ArsipController@create');
Route::put('/arsip/edit/{id}','ArsipController@update');
Route::delete('/arsip/delete/{id}','ArsipController@delete');
Route::post('cari','ArsipController@cari');

Route::get('upbjj','upbjjController@index');

Route::get('grafik','grafikController@index'); //Untuk get grafik

Route::get('grafikadafoto', 'grafikController@adafoto'); //Untuk get grafik ada foto

Route::get('grafikutpusat', 'grafikController@utpusat'); //Untuk get grafik UT Pusat

Route::get('grafikutupbjj', 'grafikController@utupbjj'); //Untuk get grafik UT UPBJJ

Route::get('grafikijazahbelumadafoto', 'grafikController@belumadafoto'); //Untuk get grafik ijazah belum ada foto

Route::get('grafikijazahsudahadafoto', 'grafikController@sudahadafoto'); //Untuk get grafik ijazah sudah ada foto

Route::post('generatepass', 'ArsipController@pass'); //generate pw pake laravel

Route::post('login', 'ArsipController@login');
