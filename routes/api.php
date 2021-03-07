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

// Route::group(['middleware' => 'auth:api'], function(){
//     Route::post('details', 'API\UserController@details');
// });
		
Route::namespace("Api")->group(function() {
	Route::prefix("school")->name("school.")->group(function() {
		Route::get('/', 'SchoolController@index')->name('index');
	});
	Route::prefix("teacher")->name("teacher.")->group(function() {
		Route::get('{schoolId}/', 'TeacherController@index')->name('index');
	});
});



