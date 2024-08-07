<?php

namespace App\Http\Controllers;

use App\Models\Kriteria;
use App\Models\Masyarakat;
use App\Models\Produk;
use App\Models\Subkriteria;

class BerandaController extends Controller
{
    public function __construct() {
        $this->middleware('auth');
    }

    public function beranda() {
        $produks = Produk::count();
        return view('beranda', compact('produks'));
    }

    public function berandaadmin() {
        $kriterias = Kriteria::count();
        $subkriterias = Subkriteria::count();

        return view('berandaadmin', compact('kriterias', 'subkriterias'));
    }
}
