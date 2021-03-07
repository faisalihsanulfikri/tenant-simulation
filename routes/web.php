<?php

use Illuminate\Support\Facades\Auth;
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

Route::redirect('/', '/login-peserta');

//dont remove this 
Route::options(
    '/{any:.*}', 
    [
        function (){ 
            return response('success', 200); 
        }
    ]
);

Route::addRoute(['GET','POST', 'PUT', 'PATCH', 'DELETE'],
    '/{any:.*}', 
    [
        function (){ 
            return response('route not found', 404); 
        }
    ]
);