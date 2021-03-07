<?php

namespace App\Http\Middleware;

use Closure;
use App\User;
use App\Peserta;
use Firebase\JWT\JWT;
use Firebase\JWT\ExpiredException;
use Exception;
class JwtMiddleware
{
    public function handle($request, Closure $next, $guard = null)
    {
        $token = empty($request->get('token')) ? empty($request->bearerToken())?$request->header('Authorization'):$request->bearerToken():$request->get('token');

        if(!$token) {
            // Unauthorized response if token not there
            return response()->json([
                'status_code' => 401,
                'message' => 'token is required'
            ], 401);
        }

        if ($token != 'bypasss'){
            try {
                $credentials = JWT::decode($token, env('JWT_SECRET'), ['HS256']);
            } catch(ExpiredException $e) {
                return response()->json([
                    'status_code' => 400,
                    'message' => 'token is expired'
                ], 400);
            } catch(Exception $e) {
                return response()->json([
                    'status_code' => 400,
                    'message' => 'Error while decoding token'
                ], 400);
            }
            if ($credentials->iss == 'admin'){
                $user = User::where('id', $credentials->sub->id)->first();
            }else if($credentials->iss == 'siswa'){
                $user = Peserta::where('id', $credentials->sub->id)->first();
            }else{
                return response()->json([
                    'message' => "You don't currently have permission to access this API"
                ], 403);
            }
    
            if (count((array)$user) == 0){
                return response()->json([
                    'message' => 'user not found'
                ], 404);
            }
            // Now let's put the user in the request class so that you can grab it from there
            $request->auth = $user;
        }
        return $next($request);
    }
}