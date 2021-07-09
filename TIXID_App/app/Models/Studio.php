<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Studio extends Model
{
    use HasFactory;
    protected $table = "studio";
    protected $fillable = ['cin_id', 'std_kapasitas'];
    protected $primaryKey = "std_id";

    public function bioskop()
    {
        return $this->belongsTo(Bioskop::class, 'cin_id', 'cin_id');
    }
}
