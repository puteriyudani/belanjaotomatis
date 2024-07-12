<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Produk extends Model
{
    use HasFactory;

    protected $table = 'produks';
    protected $guarded = [];
    protected $fillable = ['nama', 'harga', 'stock', 'sold', 'kategori'];

    public function penilaian()
    {
        return $this->hasMany(Penilaian::class, 'produk_id');
    }
}
