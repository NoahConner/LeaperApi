<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Restaurent extends Model
{
    use HasFactory;
    public function user()
    {
        return $this->belongsTo(User::class,'user_id');
    }
    public function deals()
    {
        return $this->hasMany(Deals::class,'restaurent_id');
    }
    public function deal()
    {
        return $this->belongsTo(Deals::class,'deal_id');
    }
}
