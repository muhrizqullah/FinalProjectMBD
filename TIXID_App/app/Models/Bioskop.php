<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Bioskop extends Model
{
    use HasFactory;
    protected $table = "bioskop";
    protected $fillable = ['cin_nama', 'cin_lokasi'];
    protected $primaryKey = "cin_id";

    public function studios()
    {
        return $this->hasMany(Studio::class, 'cin_id', 'cin_id');
    }
}
