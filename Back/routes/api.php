<?php

use App\Http\Controllers\AdminController;
use App\Http\Controllers\FrinedController;
use App\Http\Controllers\imageController;
use App\Http\Controllers\PostController;
use App\Http\Controllers\QueryController;
use App\Http\Controllers\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

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

Route::get('/getUser', [UserController::class, 'getUser']) -> name('getUser');
Route::get('/getUserByToken', [UserController::class, 'getUserByToken']) -> name('getUserByToken');
Route::get('/getUserImages', [imageController::class, 'getUserImages']) -> name('getUserImages');
Route::get('/getUserByTag', [UserController::class, 'getUserByTag']) -> name('getUserByTag');

Route::get('/getUserPosts', [PostController::class, 'getUserPosts']) -> name('getUserPosts');
Route::get('/getPostImages', [PostController::class, 'getPostImages']) -> name('getPostImages');
Route::get('/getAllPosts', [PostController::class, 'getAllPosts']) -> name('getAllPosts');
Route::get('/getAllFriends', [FrinedController::class, 'getAllFriends']) -> name('getAllFriends');
Route::get('/getFriendNotifications', [FrinedController::class, 'notificationFriend']);


Route::post('/createUser', [UserController::class, 'createUser']) -> name('createUser');
Route::post('/updateUserImage', [imageController::class, 'updateUserImage']) -> name('updateUserImage');
Route::post('/addToFriends', [FrinedController::class, 'addToFriends']) -> name('addToFriends');
Route::post('/checkFriendStatus', [FrinedController::class, 'checkFriendStatus']) -> name('checkFriendStatus');
Route::post('/acceptFriendship', [FrinedController::class, 'acceptFriendship']);

Route::get('/getReports', [AdminController::class, 'getReposts']);
Route::post('/deleteUser', [AdminController::class, 'deleteUser']);
Route::post('/createReport', [AdminController::class, 'createReport']);
Route::delete('/deleteReport', [AdminController::class, 'deleteReport']);


Route::post('/createUserPost', [PostController::class, 'uploadUserPost']) -> name('uploadUserPost');

//delete
Route::delete('/deletePost', [PostController::class, 'deletePost']) -> name('deletePost');
Route::delete('/denyFriendship', [FrinedController::class, 'denyFriendship']);

//Search module
Route::get('/getQueryResult', [QueryController::class, 'searchQueryGlobal']) -> name('searchQueryGlobal');
