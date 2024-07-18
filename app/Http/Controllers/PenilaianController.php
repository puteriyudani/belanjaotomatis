<?php

namespace App\Http\Controllers;

use Exception;
use App\Models\Penilaian;
use App\Models\Kriteria;
use App\Models\Produk;
use App\Models\Subkriteria;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\DB;

class PenilaianController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        // Mengambil data produk beserta penilaian dan subkriteria terkait
        $produks = Produk::with('penilaian.subkriteria')->get();

        // Mengambil data kriteria beserta subkriteria terkait
        $kriterias = Kriteria::with('subkriterias')->orderBy('id', 'ASC')->get();

        // Mengirim data ke view
        return view('penilaian.index', compact('produks', 'kriterias'));
    }

    public function store(Request $request)
    {
        // return response()->json($request);
        try {
            DB::select("TRUNCATE penilaian");

            foreach ($request->subkriteria_id as $key => $value) {
                $produk = Produk::find($key);

                foreach ($value as $key_1 => $value_1) {
                    $subkriteriaId = $value_1;

                    // Cek kriteria "stock habis"
                    if ($key_1 == 0) { // Asumsikan kriteria pertama adalah "stock habis"
                        if ($produk->stock == 0) {
                            $subkriteriaId = Subkriteria::where('nama', 'Ya')->first()->id;
                        } else {
                            $subkriteriaId = Subkriteria::where('nama', 'Tidak')->first()->id;
                        }
                    }

                    // Cek kriteria "stock"
                    if ($key_1 == 1) { // Asumsikan kriteria kedua adalah "stock"
                        if ($produk->stock < 10) {
                            $subkriteriaId = Subkriteria::where('nama', '<10')->first()->id;
                        } elseif ($produk->stock >= 10 && $produk->stock <= 100) {
                            $subkriteriaId = Subkriteria::where('nama', '10-100')->first()->id;
                        } else {
                            $subkriteriaId = Subkriteria::where('nama', '>100')->first()->id;
                        }
                    }

                    // Cek kriteria "penjualan"
                    if ($key_1 == 2) { // Asumsikan kriteria ketiga adalah "penjualan"
                        if ($produk->sold > 1000) {
                            $subkriteriaId = Subkriteria::where('nama', '>1000')->first()->id;
                        } elseif ($produk->sold >= 500 && $produk->sold <= 1000) {
                            $subkriteriaId = Subkriteria::where('nama', '500-1000')->first()->id;
                        } else {
                            $subkriteriaId = Subkriteria::where('nama', '<500')->first()->id;
                        }
                    }

                    // Cek kriteria "kategori"
                    if ($key_1 == 3) { // Asumsikan kriteria keempat adalah "kategori"
                        if ($produk->kategori == 'Harian') {
                            $subkriteriaId = Subkriteria::where('nama', 'Harian')->first()->id;
                        } elseif ($produk->kategori == 'Mingguan') {
                            $subkriteriaId = Subkriteria::where('nama', 'Mingguan')->first()->id;
                        } else {
                            $subkriteriaId = Subkriteria::where('nama', 'Bulanan')->first()->id;
                        }
                    }

                    Penilaian::create([
                        'produk_id' => $key,
                        'subkriteria_id' => $subkriteriaId
                    ]);
                }
            }

            return redirect()->route('rangking.index')->with('msg', 'Berhasil disimpan');
        } catch (Exception $e) {
            Log::emergency("File:", [$e->getFile()], "Line:", [$e->getLine()], "Message:", [$e->getMessage()]);
            die("Gagal");
        }
    }
}
