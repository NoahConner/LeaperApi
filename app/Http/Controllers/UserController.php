<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;

class UserController extends Controller
{
    public function show(){
        // $user = new User();
        // return $user->all();
        return User::where('type', 'user')->get();
    }

    public function edit($id,Request $r){
        try {
            foreach ($r->all() as $key => $value) {
                if($key == 'password'){
                    User::Where('id',$id)->update(([$key=>bcrypt($value)]));
                }else{
                    User::Where('id',$id)->update(([$key=>$value]));
                }
            }
            return response()->json(['message'=>'user updated'], 200);
        } catch (\Exception $e) {
            return response()->json(['message'=>'user not found!'], 404);
        }
    }

    public function checkUniqueMail($mail){
        $email = User::where('email',$mail)->first();
        if(!empty($email)){
            return response()->json(['message'=>'email already taken!'],403);
        }else{
            return response()->json(['message'=>'email unique'],200);
        }
    }
}
