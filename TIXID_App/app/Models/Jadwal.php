<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Jadwal extends Model
{
    use HasFactory;
    protected $table = "jadwal";
    protected $fillable = ['mov_id', 'std_id', 'sch_waktu'];
    protected $primaryKey = "sch_id";

    public function film()
    {
        return $this->belongsTo(Film::class, 'mov_id', 'mov_id');
    }

    public function kursis()
    {
        return $this->hasMany(Kursi::class, "chr_id", "chr_id");
    }

    public function studio()
    {
        return $this->belongsTo(Studio::class, "std_id", "std_id");
    }
}
