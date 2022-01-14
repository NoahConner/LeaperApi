<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;
use Laravel\Passport\RefreshToken;
use Laravel\Passport\Token;

class AuthController extends Controller
{
    public function register(Request $r){
        $validate = Validator::make($r->all(), [
            'name' => 'required|',
            'email' => 'required|email:rfc,dns|unique:users|max:255',
            'password' => 'required',
            'type' => 'required',
        ]);
        if ($validate->fails()) {
            return $validate->messages();
        }

        $user = new User();
        $user->name = $r->name;
        $user->email = $r->email;
        $user->password = Hash::make($r->newPassword);
        $user->type = $r->type;
        $user->verification_code = random_int(1000, 9999);
        $user->save();
        return $user;
    }

    public function logout(){
        $accessToken = Auth::user()->token();
        DB::table('oauth_refresh_tokens')
            ->where('access_token_id', $accessToken->id)
            ->update([
                'revoked' => true
            ]);

        $accessToken->revoke();
        return response()->json(null, 204);
    }

    public function show(){
        $user = new User();
        return $user->all();
    }
}
