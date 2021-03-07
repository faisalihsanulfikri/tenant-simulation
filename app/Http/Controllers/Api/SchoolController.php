<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use App\School;

class SchoolController extends Controller
{
    public function index()
    {
        $schools = School::all();
        return response()->json([
            "status" => "SUCCESS",
            "code" => "200",
            "message" => "Success",
            'data' => $schools
        ]);
    }
}
