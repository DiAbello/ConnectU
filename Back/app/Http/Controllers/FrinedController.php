<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class FrinedController extends Controller
{
    function getAllFriends(Request $request)
    {
        $userId = $request -> id;
    }

    function addToFriends(Request $request)
    {
        return DB::table('friendlist')
            -> insert([
                'person1' => $request -> input('from'),
                'person2' => $request -> input('to')
            ]);
    }
    function acceptFriendRequest(Request $request)
    {

    }
    function checkFriendStatus(Request $request)
    {
        if(DB::table('friendlist')
            -> where('person1', '=', $request -> input('from'))
            -> where('person2', '=', $request -> input('to'))
            -> where('friend_status', '=', 0)
            -> first()) {
            return 'request sended';
        } elseif (DB::table('friendlist')
            -> where('person1', '=', $request -> input('from'))
            -> where('person2', '=', $request -> input('to'))
            -> where('friend_status', '=', 1)
            -> first()) {
            return 'friends';
        } elseif (DB::table('friendlist')
            -> where('person1', '=', $request -> input('to'))
            -> where('person2', '=', $request -> input('from'))
            -> where('friend_status', '=', 0)
            -> first()) {
                return 'Want to be friends';
        } else {
            return 'can add to friend';
        }
    }
}
