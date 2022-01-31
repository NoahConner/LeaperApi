<?php

namespace App\Http\Controllers;

use App\Models\Restaurent;
use App\Models\User;
use Illuminate\Http\Request;

class RestaurentController extends Controller
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
     * @return \Illuminate\Http\Response
     */
    public function store(Request $r,$v)
    {
        try{
            $rest = new Restaurent();
            $rest->user_id = $v;
            $rest->city = $r->city;
            $rest->state = $r->state;
            $rest->country = $r->country;
            $rest->address = $r->address;
            $rest->save();
        } catch(\Exception $e){
            return response()->json(['status'=>'error', 'messsage' => $e->getMessage()]);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Restaurent  $restaurent
     * @return \Illuminate\Http\Response
     */

    public function showAll($cors,Restaurent $restaurent)
    {
        $arrCors = explode(',',$cors);
        $lat1 = $arrCors[0];
        $lon1 = $arrCors[1];
        $users = Restaurent::with('deals')->with('user')->get();
        foreach ($users as $key => $value) {
            $userCors = explode(',', $value->user->latlng);
            $radius = $this->distance($lat1, $lon1, $userCors[0], $userCors[1], 'K');
            $users[$key]['distance_in_km_meters'] = round($radius,1).' km';
            $users[$key]['distance_in_meters'] = round($radius*1000).' m';
        }
        return $users;
    }

    public function showOne($id){
        $rest = Restaurent::where('id',$id)->first();
        if(!empty($rest)){
            $rest['restaurent'] = User::where('id', $rest->user_id)->first();
            return $rest;
        }else{
            return response()->json(['status'=>403, 'messsage' => 'Restaurent not found']);
        }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Restaurent  $restaurent
     * @return \Illuminate\Http\Response
     */
    public function edit(Restaurent $restaurent)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Models\Restaurent  $restaurent
     * @return \Illuminate\Http\Response
     */
    public function update($id,Request $r, Restaurent $restaurent)
    {
        try {
            foreach ($r->all() as $key => $value) {
                Restaurent::Where('id',$id)->update(([$key=>$value]));
            }
            return response()->json(['message'=>'Restaurent updated'], 200);
        } catch (\Exception $e) {
            return response()->json(['message'=>'Restaurent not found!'], 404);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Restaurent  $restaurent
     * @return \Illuminate\Http\Response
     */
    public function destroy(Restaurent $restaurent)
    {
        //
    }

    function distance($lat1, $lon1, $lat2, $lon2, $unit) {

        $theta = $lon1 - $lon2;
        $dist = sin(deg2rad($lat1)) * sin(deg2rad($lat2)) +  cos(deg2rad($lat1)) * cos(deg2rad($lat2)) * cos(deg2rad($theta));
        $dist = acos($dist);
        $dist = rad2deg($dist);
        $miles = $dist * 60 * 1.1515;
        $unit = strtoupper($unit);

        if ($unit == "K") {
            return ($miles * 1.609344);
        } else if ($unit == "N") {
            return ($miles * 0.8684);
        } else {
            return $miles;
        }
      }
}
