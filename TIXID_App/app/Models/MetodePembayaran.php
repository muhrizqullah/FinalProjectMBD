<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MetodePembayaran extends Model
{
    use HasFactory;
    protected $table = "metode_pembayaran";
    protected $fillable = ['pel_id', 'mtd_jenis', 'mtd_bank', 'mtd_nomor_kartu', 'mtd_expired', 'mtd_cvv'];
    protected $primaryKey = "mtd_id";

    public function pelanggans()
    {
        return $this->belongsTo(Pelanggan::class, 'pel_id', 'pel_id');
    }

    public function transaksis()
    {
        return $this->hasMany(Transaksi::class, "mtd_id", "mtd_id");
    }

}
