<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class QueryController extends Controller
{
    function searchQueryGlobal(Request $request)
    {
        $searchedQuery = explode(' ', $request -> q);
        $users =  DB::table('users')
            -> select('users.*')
            -> where('name', 'like', "%{$request -> q}%")
            -> orWhere('surname', 'like', "%{$request -> q}%")
            -> orWhereIn('name', $searchedQuery)
            -> orWhereIn('surname', $searchedQuery)
            -> get();
        return $Response = (object) [
            'users' => $users
        ];
    }
}
