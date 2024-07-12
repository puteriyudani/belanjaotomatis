@extends('layouts.navbar')

@section('content')
    <div class="d-flex flex-wrap flex-md-nowrap pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2 me-3">Tambah Data Produk</h1>
    </div>
    @if ($errors->any())
        <div class="alert alert-danger">
            <strong>Whoops!</strong> There were some problems with your input.<br><br>
            <ul>
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    <form action="{{ route('produks.store') }}" method="POST">
        @csrf

        <div class="row g-3 mb-2 align-items-center">
            <div class="col-2">
                <label for="inputNama" class="col-form-label">Nama</label>
            </div>
            <div class="col-auto">
                <input type="text" name="nama" id="inputNama" class="form-control" aria-describedby="NamaHelpInline">
            </div>
        </div>
        <div class="row g-3 mb-2 align-items-center">
            <div class="col-2">
                <label for="inputHarga" class="col-form-label">Harga</label>
            </div>
            <div class="col-auto">
                <input type="number" name="harga" id="inputHarga" class="form-control"
                    aria-describedby="HargaHelpInline">
            </div>
        </div>
        <div class="row g-3 mb-2 align-items-center">
            <div class="col-2">
                <label for="inputKategori" class="col-form-label">Kategori</label>
            </div>
            <div class="col-auto">
                <select name="kategori" id="inputKategori" class="form-select" aria-describedby="KategoriHelpInline">
                    <option value="">Pilih Kategori</option>
                    <option value="Harian">Harian</option>
                    <option value="Mingguan">Mingguan</option>
                    <option value="Bulanan">Bulanan</option>
                </select>
            </div>
        </div>
        <div class="row g-3 mb-2 align-items-center">
            <div class="col-2">
                <label for="inputStock" class="col-form-label">Stock</label>
            </div>
            <div class="col-auto">
                <input type="number" name="stock" id="inputStock" class="form-control"
                    aria-describedby="StockHelpInline">
            </div>
        </div>
        <div class="row g-3 mb-2 align-items-center">
            <div class="col-2">
                <label for="inputSold" class="col-form-label">Sold</label>
            </div>
            <div class="col-auto">
                <input type="number" name="sold" id="inputSold" class="form-control" aria-describedby="SoldHelpInline">
            </div>
        </div>

        <button type="submit" class="btn btn-primary">Simpan</button>
    </form>
@endsection

@push('css')
    <style>
        label {
            font-weight: bold;
        }
    </style>
@endpush
