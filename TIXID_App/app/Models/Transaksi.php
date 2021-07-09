<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Transaksi extends Model
{
    use HasFactory;
    protected $table = "transaksi";
    protected $fillable = ['pel_id', 'mtd_id'];
    protected $primaryKey = "trx_id";

    public function pelanggan()
    {
        return $this->belongsTo(Pelanggan::class, 'pel_id', 'pel_id');
    }

    public function tikets()
    {
        return $this->hasMany(Tiket::class, 'trx_id', 'trx_id');
    }

    public function metodepembayaran()
    {
        return $this->belongsTo(MetodePembayaran::class, "mtd_id", "mtd_id");
    }

    public function vouchers()
    {
        return $this->belongsToMany(Voucher::class, "detail_voucher");
    }
}
