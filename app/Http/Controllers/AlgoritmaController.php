<?php

namespace App\Http\Controllers;

use App\Models\Kriteria;
use App\Models\Penilaian;
use App\Models\Produk;
use Illuminate\Http\Request;

class AlgoritmaController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        $penilaian = Penilaian::with('subkriteria', 'produks')->get();
        if (count($penilaian) == 0) {
            return redirect(route('penilaian.index'));
        }

        $produks = Produk::with('penilaian.subkriteria')->get();
        $kriterias = Kriteria::with('subkriterias')->orderBy('id', 'ASC')->get();

        //mencari min max
        $minMax = $this->min_max_penilaian($kriterias, $penilaian);

        //utility
        $utility = $this->hitung_utility($penilaian, $kriterias, $minMax);

        $nilaiAkhirPerUtility = $this->nilai_akhir_per_utility($utility, $kriterias);

        // dd($utility);
        return view('perhitungan.index', compact('produks', 'kriterias', 'utility', 'nilaiAkhirPerUtility'));
    }

    private function min_max_penilaian($criterias, $penilaian)
    {
        $minMax = [];
        foreach ($criterias as $kriteria => $value) {
            foreach ($penilaian as $key => $value1) {
                if ($value->id == $value1->subkriteria->kriteria_id) {
                    $minMax[$value->id][] = $value1->subkriteria->bobot;
                }
            }
        }

        return $minMax;
    }

    private function hitung_utility($penilaian, $criterias, $minMax)
    {
        $utilities = [];

        foreach ($penilaian as $key => $value1) {
            foreach ($criterias as $kriteria => $value) {
                if ($value->id == $value1->subkriteria->kriteria_id && $value1->produks) {
                    $divisor = max($minMax[$value->id]) - min($minMax[$value->id]);
                    if ($divisor != 0) {
                        $utilities[$value1->produks->nama][] = round(($value1->subkriteria->bobot - min($minMax[$value->id])) / $divisor, 3);
                    } else {
                        $utilities[$value1->produks->nama][] = 0; // atau nilai yang sesuai dengan kebutuhan Anda jika pembagi nol
                    }
                }
            }
        }

        return $utilities;
    }

    private function nilai_akhir_per_utility($utilities, $criterias)
    {
        $result = [];
        // hasil = utility * bobot
        foreach ($utilities as $name => $utilityVal) {
            foreach ($criterias as $criteria => $criteriaVal) {
                $key = $criteriaVal->id - 1;

                if (array_key_exists($key, $utilityVal)) {
                    $result[$name][] = round($criteriaVal->bobot * $utilityVal[$key], 3);
                } else {
                    // Pesan error jika kunci tidak ditemukan
                    $result[$name][] = "-";
                }
            }
        }

        return $result;
    }

    private function prosesrank($utility, $nilaiAkhirPerUtility)
    {
        $nilaiAkhir = [];
        foreach ($utility as $key => $value) {
            // Convert all elements to numeric before summing
            $numericValues = array_map('floatval', $nilaiAkhirPerUtility[$key]);
            $nilaiAkhir[$key][] = array_sum($numericValues) * 100;
        }

        arsort($nilaiAkhir);
        return $nilaiAkhir;
    }

    public function rank()
    {
        $penilaian = Penilaian::with('subkriteria', 'produks')->get();
        if (count($penilaian) == 0) {
            return redirect(route('penilaian.index'));
        }

        $produks = Produk::with('penilaian.subkriteria')->get();
        $kriterias = Kriteria::with('subkriterias')->orderBy('id', 'ASC')->get();

        // Mencari min max
        $minMax = $this->min_max_penilaian($kriterias, $penilaian);

        // Utility
        $utility = $this->hitung_utility($penilaian, $kriterias, $minMax);

        $nilaiAkhirPerUtility = $this->nilai_akhir_per_utility($utility, $kriterias);

        // Rank
        $nilaiAkhir = $this->prosesrank($utility, $nilaiAkhirPerUtility);

        // Ambil nama produk berdasarkan urutan nilaiAkhir
        $orderedProductNames = array_keys($nilaiAkhir);

        // Ambil produk sesuai urutan dan urutkan berdasarkan sold
        $orderedProduks = [];
        foreach ($orderedProductNames as $productName) {
            $product = $produks->firstWhere('nama', $productName);
            if ($product) {
                $orderedProduks[] = $product;
            }
        }

        // Urutkan produk berdasarkan sold (dari yang paling sedikit ke paling banyak)
        usort($orderedProduks, function ($a, $b) {
            return $a->sold <=> $b->sold;
        });

        return view('rangking.index', compact('produks', 'nilaiAkhir', 'orderedProduks'))
            ->with('i');
    }
}
