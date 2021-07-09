<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class KategoriFilm extends Model
{
    use HasFactory;
    protected $table = "kategori_film";
    protected $fillable = ['cat_nama'];
    protected $primaryKey = "cat_id";

    public function films()
    {
        return $this->hasMany(Film::class, 'cat_id', 'cat_id');
    }
}
