<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Voucher extends Model
{
    use HasFactory;
     protected $table = "voucher";
    protected $fillable = ['voc_kode_voucher', 'voc_nominal'];
    protected $primaryKey = "voc_id";

    public function transaksis()
    {
        return $this->belongsToMany(Transaksi::class, "detail_voucher");
    }
}
