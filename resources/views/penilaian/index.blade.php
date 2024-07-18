@extends('layouts.navbar')

@section('content')
    <div class="d-flex flex-wrap flex-md-nowrap pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2 me-3">Belanja Cepat</h1>
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

    @if ($message = Session::get('msg'))
        <div class="alert alert-success">
            <p>{{ $message }}</p>
        </div>
    @endif

    <form action="{{ route('penilaian.store') }}" method="POST">
        @csrf
        <table class="table table-striped table-sm" hidden>
            <thead>
                <tr>
                    <th>No</th>
                    <th scope="col">Nama Produk</th>
                    @foreach ($kriterias as $kriteria)
                        <th>{{ $kriteria->nama }}</th>
                    @endforeach
                </tr>
            </thead>
            <tbody>
                @forelse ($produks as $produk)
                    <tr>
                        <td>{{ $loop->iteration }}</td>
                        <td>{{ $produk->nama }}</td>
                        @foreach ($kriterias as $kriteria)
                            <td>
                                <select name="subkriteria_id[{{ $produk->id }}][]" class="form-control">
                                    @foreach ($kriteria->subkriterias as $subkriteria)
                                        @php
                                            $selected = '';
                                            foreach ($produk->penilaian as $penilaian) {
                                                if (
                                                    $penilaian->subkriteria->kriteria_id == $kriteria->id &&
                                                    $penilaian->subkriteria_id == $subkriteria->id
                                                ) {
                                                    $selected = 'selected';
                                                }
                                            }
                                        @endphp
                                        <option value="{{ $subkriteria->id }}" {{ $selected }}>
                                            {{ $subkriteria->nama }}
                                        </option>
                                    @endforeach
                                </select>
                            </td>
                        @endforeach
                    </tr>
                @empty
                    <tr>
                        <td colspan="{{ count($kriterias) + 2 }}">Tidak ada data</td>
                    </tr>
                @endforelse
            </tbody>
        </table>
        <button type="submit" class="btn btn-primary">List 10 Barang</button>
    </form>

    {{-- {!! $produks->links() !!} --}}
@endsection

@push('css')
    <style>
        label {
            font-weight: bold;
        }
    </style>
@endpush
