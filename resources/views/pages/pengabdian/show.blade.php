@extends('layouts.template')

@section('content')
    <!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- Page Heading -->
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Detail Pengabdian</h1>
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
                        <th>Skim Pengabdian</th>
                        <td>{{ $pengabdian->skim_pengabdian }}</td>
                    </tr>
                    <tr>
                        <th>Nama Ketua Pengabdian</th>
                        <td>{{ $pengabdian->nama_ketua_pengabdian }}</td>
                    </tr>
                    <tr>
                        <th>Jurusan</th>
                        <td>{{ $pengabdian->jurusan }}</td>
                    </tr>
                    <tr>
                        <th>Judul</th>
                        <td>{{ $pengabdian->judul }}</td>
                    </tr>
                    <tr>
                        <th>Nominal Dana</th>
                        <td>@currency($pengabdian->besar_dana)</td>
                    </tr>
                    <tr>
                        <th>Kategori</th>
                        <td>{{ $pengabdian->kategori }}</td>
                    </tr>
                    <tr>
                        <th>Tahun</th>
                        <td>{{ $pengabdian->tahun }}</td>
                    </tr>
                    <tr>
                        <th>Nama Anggota</th>
                        <td>{{ !empty($pengabdian->nama_anggota) ? $pengabdian->nama_anggota : '-' }}</td>
                    </tr>
                </table>
            </div>
        </div>


    </div>
    <!-- /.container-fluid -->

@endsection
