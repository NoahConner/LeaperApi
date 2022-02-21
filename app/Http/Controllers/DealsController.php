<?php

namespace App\Http\Controllers;

use App\Models\Deals;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class DealsController extends Controller
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
        $validate = Validator::make($request->all(),[
            'restaurent_id' => 'required',
            'deal_name' => 'required',
            'deal_price' => 'required',
            'deal_person_quantity' => 'required',
            'deal_quantity' => 'required',
            'deal_menu' => 'required',
            'deal_image' => 'required',
        ]);

        if($validate->fails()){
            return $validate->message();
        }

        try{
            $deals = new Deals();
            $deals->restaurent_id = $request->restaurent_id;
            $deals->deal_name = $request->deal_name;
            $deals->deal_price = $request->deal_price;
            $deals->deal_person_quantity = $request->deal_person_quantity;
            $deals->deal_quantity = $request->deal_quantity;
            $deals->deal_menu = $request->deal_menu;
            $deals->deal_image = $request->deal_image;
            if($deals->save()){
                return response()->json(['status'=>200, 'message'=>'deal added successfully.']);
            }
        }catch(\Exception $e){
            return response()->json(['status'=>'error', 'message'=>$e->getMessage()]);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Deals  $deals
     * @return \Illuminate\Http\Response
     */
    public function show(Deals $deals)
    {
        // return Deals::all();
        return Deals::where('status', 1)->get();
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Deals  $deals
     * @return \Illuminate\Http\Response
     */
    public function edit(Deals $deals)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Deals  $deals
     * @return \Illuminate\Http\Response
     */
    public function update($id,Request $request, Deals $deals)
    {
        try{
            foreach ($request->all() as $key => $value) {
                Deals::where('id',$id)->update([$key => $value]);
            }
            return response()->json(['message'=>'deal updated'],200);
        }catch(\Exception $e){
            return response()->json(['message'=>'deal not found!'], 404);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Deals  $deals
     * @return \Illuminate\Http\Response
     */
    public function destroy($id,Request $request, Deals $deals)
    {
        try{
            // Deals::where('id', $id)->delete();
            Deals::where('id',$id)->update(['status' => 0]);
            return response()->json(['message'=>'deal deleted'],200);
        }catch(\Exception $e){
            return response()->json(['message'=>$e], 404);
        }
    }
}
