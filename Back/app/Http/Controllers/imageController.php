<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class imageController extends Controller
{
    function updateUserImage(Request $request) {
        $userImage = $request -> file('file');
        $userTag = $request -> input('tag');
        $userImage -> move('C:\xampp\htdocs\ConnectU\Front\src\assets\images\users/' . $userTag, $userImage -> getClientOriginalName());
        DB::table('users')
            -> where('id', '=', $request -> input('id'))
            -> update([
               'profile_photo' => $request -> input('fileName')
            ]);
        DB::table('user_images') -> insert([
           'user_id' => $request -> input('id'),
           'image_name' => $request -> input('fileName')
        ]);
        return DB::table('users')
            -> where('id', '=', $request -> input('id'))
            -> first();
    }
    function getUserImages(Request $request) {
        return DB::table('user_images')
            -> select('user_images.id', 'user_images.image_name', 'users.id as user_id', 'user_images.created_at', 'user_images.like_count', 'users.name as user_name', 'users.surname as user_surname', 'users.tag as user_tag', 'users.profile_photo')
            -> join('users', 'user_images.user_id', '=', 'users.id')
            -> where('user_images.user_id', '=', $request -> id)
            -> get();
    }
}
