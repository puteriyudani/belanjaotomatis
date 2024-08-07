@extends('layouts.navbar')

@section('content')
    @auth
        <div class="d-flex flex-wrap flex-md-nowrap pt-3 pb-2 mb-3 border-bottom">
            <h1 class="h2">Beranda</h1>
        </div>
        <div class="mb-5">
            <a href="{{ route('produks.index') }}" class="btn btn-primary btn-lg px-4 me-3">
                <h2>{{ $produks }}</h2>
                <p>Data Produk</p>
            </a>
        </div>
    @endauth
@endsection

@push('css')
    <style>
        .btn {
            text-align: justify;
        }

        .btn h2 {
            font-weight: bold;
        }
    </style>
@endpush
