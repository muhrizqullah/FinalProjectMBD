<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Tiket extends Model
{
    use HasFactory;
    protected $table = "tiket";
    protected $fillable = ['trx_id', 'chr_id'];
    protected $primaryKey = "tik_id";

    public function transaksi()
    {
        return $this->belongsTo(Transaksi::class, 'trx_id', 'trx_id');
    }

    public function Kursi()
    {
        return $this->belongsTo(Kursi::class, "tik_id", "tik_id");
    }

}
