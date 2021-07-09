<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Kursi extends Model
{
    use HasFactory;
    protected $table = "kursi";
    protected $fillable = ['tik_id', 'sch_id', 'chr_kode'];
    protected $primaryKey = "chr_id";

    public function tiket()
    {
        return $this->hasOne(Tiket::class, "tik_id", "tik_id");
    }
}
