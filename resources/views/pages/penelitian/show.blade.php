@extends('layouts.template')

@section('content')
    <!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- Page Heading -->
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Detail Penelitian</h1>
            {{-- <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                    class="fas fa-download fa-sm text-white-50"></i> Generate Report</a> --}}
        </div>

        @if ($errors->any())
            <div class="alert alert-danger">
                <ul>
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
        @endif

        <div class="card shadow">
            <div class="card-body">
                <table class="table">
                    <tr>
                        <th>Skim Penelitian</th>
                        <td>{{ $penelitian->skim_penelitian }}</td>
                    </tr>
                    <tr>
                        <th>Nama Ketua Penelitian</th>
                        <td>{{ $penelitian->nama_ketua_penelitian }}</td>
                    </tr>
                    <tr>
                        <th>Jurusan</th>
                        <td>{{ $penelitian->jurusan }}</td>
                    </tr>
                    <tr>
                        <th>Judul</th>
                        <td>{{ $penelitian->judul }}</td>
                    </tr>
                    <tr>
                        <th>Nominal Dana</th>
                        <td>@currency($penelitian->besar_dana)</td>
                    </tr>
                    <tr>
                        <th>Kategori</th>
                        <td>{{ $penelitian->kategori }}</td>
                    </tr>
                    <tr>
                        <th>Tahun</th>
                        <td>{{ $penelitian->tahun }}</td>
                    </tr>
                    <tr>
                        <th>Nama Anggota</th>
                        <td>{{ !empty($penelitian->nama_anggota) ? $penelitian->nama_anggota : '-' }}</td>
                    </tr>
                </table>
            </div>
        </div>


    </div>
    <!-- /.container-fluid -->

@endsection
