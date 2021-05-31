@extends('layouts.template')

@section('content')
    <!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- Page Heading -->
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Detail Jurusan {{ $jurusan->nama_jurusan }}</h1>

        <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
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
                <table class="table table-bordered">
                    <tr>
                        <th>Nama Jurusan</th>
                        <td>{{ $jurusan->nama_jurusan }}</td>
                    </tr>
                    <tr>
                        <th>Logo Jurusan</th>
                        <td><img src="{{ asset('fotoupload/'.$jurusan->logo) }}" alt="" style="width: 200px" class="img-thumbnail" data-toggle="modal" data-target="#fotoKerusakanModal"></td>
                    </tr>
                    <tr>
                        <th>Prodi</th>
                        <td>
                            <table class="table table-bordered">
                                <tr>
                                    <th>Nama Prodi</th>
                                </tr>
                                @forelse ($jurusan->prodi as $item)
                                    <tr>
                                        <td>{{ $item->nama_prodi}}</td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td colspan="7" class="text-center">
                                            Data tidak ada
                                        </td>
                                    </tr>
                                @endforelse
                            </table>
                        </td>
                    </tr>
                </table>
            </div>
        </div>


    </div>
    <!-- /.container-fluid -->

@endsection
