<?php

namespace App\Http\Controllers;

use App\Models\Orders;
use App\Models\Restaurent;
use App\Models\User;
use Illuminate\Http\Request;

class OrdersController extends Controller
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
            $rest = new Orders();
            $rest->deal_id = $request->deal_id;
            $rest->user_id = $request->user_id;
            $rest->leaper_name = $request->leaper_name;
            $rest->leaper_dob = $request->leaper_dob;
            $rest->coupon = $request->coupon;
            $rest->save();
            return response()->json(['status'=>200, 'messsage' => 'Order created successfully'],200);
        } catch(\Exception $e){
            return response()->json(['status'=>'error', 'messsage' => $e->getMessage()]);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Orders  $orders
     * @return \Illuminate\Http\Response
     */
    public function show(Orders $orders)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Orders  $orders
     * @return \Illuminate\Http\Response
     */
    public function edit(Orders $orders)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Orders  $orders
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Orders $orders)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Orders  $orders
     * @return \Illuminate\Http\Response
     */
    public function destroy(Orders $orders)
    {
        //
    }

    public function showById($id)
    {
        try{
            $deal = Orders::where('user_id',$id)->with('deal')->get();
            foreach ($deal as $key => $value) {
                $rest = Restaurent::where('id',$value->deal->restaurent_id)->first();
                $rest['user'] = User::where('id',$rest->user_id)->first();
                $value['restaurent'] = $rest;
            }
            return $deal;
        }catch(\Exception $e){
            return response()->json(['status'=>'error', 'messsage' => $e->getMessage()]);
        }
    }

    public function showByRestaurant($id){
        $deal = Orders::with('deal')->get();
            foreach ($deal as $key => $value) {
                $rest = Restaurent::where('id',$value->deal->restaurent_id)->first();
                $rest['user'] = User::where('id',$rest->user_id)->first();
                $value['restaurent'] = $rest;
            }
        return $deal;
    }
}
