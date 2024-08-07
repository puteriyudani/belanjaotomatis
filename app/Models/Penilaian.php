<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Penilaian extends Model
{
    protected $table = 'penilaian';
    protected $guarded = [];
    protected $fillable = ['produk_id', 'subkriteria_id'];

    public function subkriteria()
    {
        return $this->belongsTo(Subkriteria::class, 'subkriteria_id');
    }

    public function produks() {
        return $this->belongsTo(Produk::class, 'produk_id');
    }
}
