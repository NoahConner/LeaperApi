<?php

namespace App\Http\Controllers;

use App\Models\CurrentWallet;
use Illuminate\Http\Request;

class CurrentWalletController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store($a,Request $request)
    {
        try{
            $userRes = auth()->guard('api')->user();
            $user = CurrentWallet::where('user_id', $userRes->id)->first();
            if(empty($user)){
                $new = new CurrentWallet();
                $new->user_id = $userRes->id;
                $new->wallet = $a;

                $new->save();
                return response()->json(['status'=>200, 'messsage' => 'Wallet Deposit successfully'],200);
            }else{
                $wa = CurrentWallet::where('user_id', $userRes->id)->first();
                return $wa;
                CurrentWallet::where('user_id', $userRes->id)->update(['wallet' => $a]);
                return response()->json(['status'=>200, 'messsage' => 'Wallet update successfully'],200);
            }

        }catch(\Exception $e){
            return response()->json(['status'=>'error','message'=>$e]);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\CurrentWallet  $currentWallet
     * @return \Illuminate\Http\Response
     */
    public function show(CurrentWallet $currentWallet)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\CurrentWallet  $currentWallet
     * @return \Illuminate\Http\Response
     */
    public function edit(CurrentWallet $currentWallet)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\CurrentWallet  $currentWallet
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, CurrentWallet $currentWallet)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\CurrentWallet  $currentWallet
     * @return \Illuminate\Http\Response
     */
    public function destroy(CurrentWallet $currentWallet)
    {
        //
    }
}
