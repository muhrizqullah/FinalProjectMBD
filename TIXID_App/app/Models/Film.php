<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Film extends Model
{
    use HasFactory;
    protected $table = "film";
    protected $fillable = ['cat_id', 'mov_judul', 'mov_durasi'];
    protected $primaryKey = "mov_id";

    public function kategorifilm()
    {
        return $this->belongsTo(KategoriFilm::class, "cat_id", "cat_id");
    }

    public function jadwals()
    {
        return $this->hasMany(Jadwal::class, 'mov_id', 'mov_id');
    }
}
