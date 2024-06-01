<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PostController extends Controller
{
    function uploadUserPost(Request $request) {
        $tag = $request -> input('userTag');
        $userId = $request -> input('userId');
        $path = 'C:\xampp\htdocs\ConnectU\Front\src\assets\images\posts\users/'.$tag;
        $images = $request -> file('images');
        $postId = DB::table('posts') -> insertGetId([
            'user_id' => $userId,
            'content' => $request -> input('text')
        ]);
            foreach ($images as $image) {
                $image -> move($path, $image -> getClientOriginalName());
                DB::table('post_images') -> insert([
                    'post_id' => $postId,
                    'image_name' => $image -> getClientOriginalName()
                ]);
            }

        return DB::table('posts')
            -> select('posts.id', 'users.id as userId', 'users.name as name', 'users.surname as surname', 'users.tag', 'users.profile_photo', 'posts.created_at', 'posts.content')
            -> join('users', 'posts.user_id', '=', 'users.id')
            -> where('posts.id', '=', $postId)
            -> first();
    }

    function getUserPosts(Request $request) {
        return DB::table('posts')
            -> select('posts.id', 'users.id as userId', 'users.surname as surname', 'users.name as name', 'users.tag as tag', 'users.profile_photo as profile_photo', 'posts.created_at', 'posts.content')
            -> join('users', 'posts.user_id', '=', 'users.id')
            -> where('user_id', '=', $request -> id)
            -> latest()
            -> get();
    }
    function getPostImages(Request $request) {
        return DB::table('post_images') -> where('post_id', '=', $request -> postId) -> get();
    }
    function getAllPosts(Request $request) {
        return DB::table('posts')
            -> select('posts.id', 'users.id as userId',  'users.surname as surname', 'users.name as name', 'users.tag as tag', 'users.profile_photo as profile_photo', 'posts.created_at', 'posts.content')
            -> join('users', 'posts.user_id', '=', 'users.id')
            -> latest()
            -> get();
    }
    function deletePost(Request $request)
    {
        if(DB::table('post_images') -> where('post_images.post_id', '=', $request -> id) -> get()) {
            DB::table('post_images') -> where('post_images.post_id', '=', $request -> id) -> delete();
        }
        return DB::table('posts')
            -> where('posts.id', '=', $request -> id)
            -> delete();

    }
}
