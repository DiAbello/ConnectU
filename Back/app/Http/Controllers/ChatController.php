<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ChatController extends Controller
{
    function sendMessage(Request $request)
    {
        if($chat = DB::table('chats')
            -> where([
                ['person1', '=', $request -> input('sender')],
                ['person2', '=', $request -> input('getter')]
            ])
        -> orWhere([
            ['person2', '=', $request -> input('sender')],
            ['person1', '=', $request -> input('getter')]
        ]) -> first()) {
            DB::table('chat')
                -> insert([
                    'chat_id' => $chat -> id,
                    'user_id' => $request -> input('sender'),
                    'content' => $request -> input('content')
                ]);
        } else {
            $chatId = DB::table('chats')
                -> insertGetId([
                    'person1' => $request -> input('sender'),
                    'person2' => $request -> input('getter')
                ]);
            DB::table('chat')
                -> insert([
                    'chat_id' => $chatId,
                    'user_id' => $request -> input('sender'),
                    'content' => $request -> input('content'),
                ]);
            return 'chat created and message sended';

        }
    }

    function getMessages(Request $request)
    {
        $chatId = DB::table('chats')
            -> select('id')
            -> where([
                ['person1', '=', $request -> input('person1')],
                ['person2', '=', $request -> input('person2')]
            ])
            -> orWhere([
                ['person2', '=', $request -> input('person1')],
                ['person1', '=', $request -> input('person2')]
            ]) -> first();
        if($chatId) {
            return DB::table('chat')
                -> select('users.name as name', 'users.surname as surname', 'users.tag as tag', 'chat.send_at as send_at', 'users.id as id', 'users.profile_photo as profile_photo', 'chat.content as content')
                -> join('users', 'chat.user_id', '=', 'users.id')
                -> where('chat_id', '=', $chatId -> id)
                -> get();
        } else {
            return [];
        }

    }

    function getChats(Request $request)
    {
        if($chats =  DB::table('chats')
            -> where([
                ['person1', '=', $request -> id]
            ])
            -> orWhere([
                ['person2', '=', $request -> id]
            ]) -> get()) {
            $arr = [];
            foreach ($chats as $item) {
                $chatId = $item -> id;
                if($item -> person1 == $request -> id) {
                    $friend = DB::table('users') -> where('users.id', '=',  $item -> person2) -> first();
                    $friend -> chatId = $chatId;
                    $latestMessage = DB::table('chat') -> where('chat_id', '=', $chatId) ->  max('send_at');
                    $content = DB::table('chat') -> select('chat.content', 'chat.user_id as userId') -> where([
                        ['send_at', '=', $latestMessage],
                        ['chat_id', '=', $chatId]
                    ]) -> first();
                    $friend -> content = $content -> content;
                    $friend -> userId = $content -> userId;
                    array_push($arr, $friend);
                } else if ($item -> person2 == $request -> id) {
                    $friend = DB::table('users') -> where('users.id', '=',  $item -> person1) -> first();
                    $friend -> chatId = $chatId;
                    $latestMessage = DB::table('chat') -> where('chat_id', '=', $chatId) -> max('send_at');
                    $content = DB::table('chat') -> select('chat.content', 'chat.user_id as userId') -> where([
                        ['send_at', '=', $latestMessage],
                        ['chat_id', '=', $chatId]
                    ]) -> first();
                    $friend -> content = $content -> content;
                    $friend -> userId = $content -> userId;
                    array_push($arr, $friend);
                }
            }
            return $arr;
        } else {
            return [];
        }

    }
}
