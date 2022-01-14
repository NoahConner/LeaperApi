<?php

namespace App\Http\Controllers;

use App\Models\Restaurent;
use App\Http\Requests\StoreRestaurentRequest;
use App\Http\Requests\UpdateRestaurentRequest;

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
     * @param  \App\Http\Requests\StoreRestaurentRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreRestaurentRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Restaurent  $restaurent
     * @return \Illuminate\Http\Response
     */
    public function show(Restaurent $restaurent)
    {
        //
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
     * @param  \App\Http\Requests\UpdateRestaurentRequest  $request
     * @param  \App\Models\Restaurent  $restaurent
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateRestaurentRequest $request, Restaurent $restaurent)
    {
        //
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
}
