<?php

use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\IController;

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
    return view('welcome');
});

Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';

//view all posts and category//
Route::get('/postview',[IController::class,'post_view']);

//view details of post//
Route::get('/viewdetails/{id}',[IController::class,'view_details']);

//addcomment//
Route::post('/addcomment',[IController::class,'add_comment']);
Route::get('/viewdetails',[IController::class,'view']);

//Category display//
Route::get('/displaycategory/{id}',[IController::class,'display_category']);

//search category//
Route::post('categorysearch', [IController::class,'search_category']);