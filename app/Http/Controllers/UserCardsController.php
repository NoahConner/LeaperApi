<?php

namespace App\Http\Controllers;

use App\Models\UserCards;
use Illuminate\Http\Request;

class UserCardsController extends Controller
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
    public function store(Request $request)
    {
        try{
            $rest = new UserCards();
            $rest->user_id = $request->user_id;
            $rest->card_no = $request->card_no;
            $rest->card_expiry = $request->card_expiry;
            $rest->card_cvv = $request->card_cvv;
            $rest->card_name = $request->card_name;
            $rest->card_type = $request->card_type;
            $rest->save();
            return response()->json(['status'=>200, 'messsage' => 'Card add successfully'],200);
        } catch(\Exception $e){
            return response()->json(['status'=>'error', 'messsage' => $e->getMessage()]);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\UserCards  $userCards
     * @return \Illuminate\Http\Response
     */
    public function show(UserCards $userCards,$id)
    {
        $cards = UserCards::where(['user_id'=>$id, 'status' => 1])->get();
        return $cards;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\UserCards  $userCards
     * @return \Illuminate\Http\Response
     */
    public function edit(UserCards $userCards)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\UserCards  $userCards
     * @return \Illuminate\Http\Response
     */
    public function update($id, Request $request, UserCards $userCards)
    {
        try{
            foreach ($request->all() as $key => $value) {
                // return ([$key => $value]);
                UserCards::where('id',$id)->update([$key => $value]);
            }
            return response()->json(['message'=>'Card updated'],200);
        }catch(\Exception $e){
            return response()->json(['message'=>$e->getMessage()], 404);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\UserCards  $userCards
     * @return \Illuminate\Http\Response
     */
    public function destroy(UserCards $userCards)
    {
        //
    }
}
