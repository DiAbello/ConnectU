<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class FrinedController extends Controller
{
    function getAllFriends(Request $request)
    {
        $userId = $request -> id;
       if($friends = DB::table('friendlist')
           -> where([
           ['person1', '=', $userId],
           ['friend_status','=', 1]
       ])
           -> orWhere([
               ['person2', '=', $userId],
               ['friend_status','=', 1]
           ])
           -> get()) {
           $arr = [];
           foreach ($friends as $item) {
               if($item -> person1 == $userId) {
                   $friend = DB::table('users') -> where('users.id', '=',  $item -> person2) -> first();
                   array_push($arr, $friend);
               }
               elseif ($item -> person2 == $userId) {
                   $friend = DB::table('users') -> where('users.id', '=', $item -> person1) -> first();
                   array_push($arr, $friend);
               }
           }
           return $arr;
       } else {
           return [];
       }
    }
    public function notificationFriend(Request $request)
    {
        $userId = $request -> id;
        if($friends = DB::table('friendlist')
            -> where([
                ['person2', '=', $userId],
                ['friend_status','=', 0]
            ])
            -> get()) {
            $arr = [];
            foreach ($friends as $item) {
                if($item -> person1 == $userId) {
                    $friend = DB::table('users') -> where('users.id', '=',  $item -> person2) -> first();
                    array_push($arr, $friend);
                }
                elseif ($item -> person2 == $userId) {
                    $friend = DB::table('users') -> where('users.id', '=', $item -> person1) -> first();
                    array_push($arr, $friend);
                }
            }
            return $arr;
        } else {
            return [];
        }
    }

    function addToFriends(Request $request)
    {
        return DB::table('friendlist')
            -> insert([
                'person1' => $request -> input('from'),
                'person2' => $request -> input('to')
            ]);
    }
    function acceptFriendship(Request $request)
    {
        DB::table('friendlist')
            -> where([
                ['person1', '=', $request -> input('from')],
                ['person2', '=', $request -> input('to')]
            ]) -> orWhere([
                ['person1', '=', $request -> input('to')],
                ['person2', '=', $request -> input('from')]
            ]) -> update([
                'friend_status' => 1
            ]);

    }

    function denyFriendship(Request $request)
    {
        DB::table('friendlist')
            -> where([
                ['person1', '=', $request -> from],
                ['person2', '=', $request -> to]
            ]) -> orWhere([
                ['person1', '=', $request -> to],
                ['person2', '=', $request -> from]
            ]) -> delete();
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
            -> where([
                ['person1', '=', $request -> input('from')],
                ['person2', '=', $request -> input('to')],
                ['friend_status', 1]
            ]) -> orWhere([
                ['person1', '=', $request -> input('to')],
                ['person2', '=', $request -> input('from')],
                ['friend_status', 1]
            ]) -> first()) {
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
