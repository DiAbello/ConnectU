<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AdminController extends Controller
{
    public function deleteUser(Request $request)
    {
        DB::table('users')
            -> where('users.id', '=', $request -> input('userId'))
            -> delete();
        DB::table('posts')
            -> where('posts.user_id', $request -> input('userId'))
            -> delete();
        DB::table('user_images')
            -> where('user_images.user_id', $request -> input('userId'))
            -> delete();
    }
    public function createReport(Request $request)
    {
        DB::table('reports') -> insert([
            'report_sender' => $request -> input('senderId'),
            'report_offending' => $request -> input('offendingId'),
            'content' => $request -> input('content')
        ]);
    }
    public function getReposts()
    {
        $reports = DB::table('reports')
            -> select('reports.id as id', 'report_sender', 'report_offending', 'reports.content', 'reports.timestamp')
            -> get();
        foreach ($reports as $value) {
            $value -> report_sender = DB::table('users') -> select('users.*') -> where('users.id', '=', $value -> report_sender) -> first();
            $value -> report_offending = DB::table('users') -> select('users.*') -> where('users.id', '=', $value -> report_offending) -> first();
        }
        return $reports;
    }
    public function deleteReport(Request $request)
    {
        return DB::table('reports')
            -> where('id', '=', $request -> id)
            -> delete();
    }
}
