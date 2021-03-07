<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use App\School;
use App\Teacher;
use DB;

class TeacherController extends Controller
{
    public function index($schoolId)
    {
        /** SET DATABASE CONNECTION */
        try {
            $this->_setConnection($schoolId);
            
            $teachers = Teacher::all();
            return response()->json([
                "status" => "SUCCESS",
				"code" => "200",
				"message" => "Success",
                'data' => $teachers
            ],200);
        } catch (\Throwable $th) {
            return response()->json([
                "status" => "ERROR",
				"code" => "400",
				"message" => "Set connection failed"
            ],400);
        }
    }

    /** SET DATABASE CONNECTION */
    private function _setConnection($id)
    {
        $school = School::find($id);

        \Config::set('database.connections.mysql.database', $school->getDBName());
        \Config::set('database.connections.mysql.username', $school->getDBUsername());
        \Config::set('database.connections.mysql.password', $school->getDBPassword());
        DB::purge('mysql');
    }
}
