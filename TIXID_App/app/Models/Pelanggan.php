<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pelanggan extends Model
{
    use HasFactory;
    protected $table = "pelanggan";
    protected $fillable = ['pel_nama', 'pel_email', 'pel_no_telepon'];
    protected $primaryKey = "pel_id";

    public function transaksis()
    {
        return $this->hasMany(Transaksi::class, 'pel_id', 'pel_id');
    }

    public function metodepembayarans(){
        return $this->hasMany(MetodePembayaran::class, 'pel_id', 'pel_id');
    }
}
