<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class UserController extends Controller
{
    function createUser(Request $request){
        $accessTag = DB::table('users') -> where('tag', '=', $request -> input('tag')) -> first();
        $accessEmail = DB::table('users') -> where('email', '=', $request -> input('email')) -> first();
        if($accessTag) {
            return $accessTag -> tag;
        } elseif ($accessEmail) {
            return $accessEmail -> email;
        } elseif (is_null($accessTag) && is_null($accessEmail)) {
            $tag = $request -> input('tag');
            $directoryPath = 'C:\xampp\htdocs\ConnectU\Front\src\assets\images\users/' . $tag;
            $postPath = 'C:\xampp\htdocs\ConnectU\Front\src\assets\images\posts/' . $tag;
            File::makeDirectory($directoryPath, $mode = 0777, true, true);
            File::makeDirectory($postPath, $mode = 0777, true, true);
            return DB::table('users') -> insert([
                'name' => $request -> input('name') ,
                'surname' => $request -> input('surname'),
                'tag' => $request -> input('tag'),
                'email' => $request -> input('email'),
                'password' => Hash::make($request -> input('password')),
                'remember_token' => Str::random(50)
            ]);
        }

    }
    function getUser(Request $request) {
        $email = $request->email;
        $password = $request -> password;
        $user = DB::table('users') -> where('email', '=', $email) -> first();
        if($user) {
            if(Hash::check($password, $user -> password)) {
                return $user;
            }
            else {
                return false;
            }
        } else {
            return false;
        }
    }
    function getUserByToken(Request $request) {
        return DB::table('users')
            -> where('remember_token', '=', $request -> remember_token) -> first();
    }
    function getUserByTag(Request $request) {
        return DB::table('users')
            -> where('tag', '=', $request -> tag) -> first();
    }

    function getUserById(Request $request)
    {
        return DB::table('users')
            -> where('id', '=', $request -> id) -> first();
    }
}
