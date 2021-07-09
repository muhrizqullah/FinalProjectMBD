<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DetailVoucher extends Model
{
    use HasFactory;
    protected $table = "detail_voucher";
    protected $fillable = ['trx_id', 'voc_id'];
    protected $primaryKey = "trx_id";

    // public function voucher()
    // {
    //     return $this->belongsTo(Voucher::class, "voc_id", "voc_id");
    // }

    // public function transaksi()
    // {
    //     return $this->belongsTo(Transaksi::class, "trx_id", "trx_id");
    // }
}
