@extends('layouts.template')

@section('content')

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Data Skim</h1>
            {{-- <a href="{{ url('/jurusan/create') }}" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
                <i class="fas fa-plus fa-sm text-white-50"></i> Tambah Jurusan
            </a> --}}
        </div>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>No</th>
                      <th>Nama Skim</th>
                      <th>Jenis</th>
                    </tr>
                  </thead>
                  <tbody>
                    @php $i=1 @endphp
                    @forelse ($items as $item)
                        <tr>
                          <td>{{ $i++ }}</td>
                          <td>{{ $item->skim}}</td>
                          <td>{{ $item->jenis }}</td>
                        </tr>
                    @empty
                        <tr>
                            <td colspan="7" class="text-center">
                                Data tidak ada
                            </td>
                        </tr>
                    @endforelse
                  </tbody>
                </table>
              </div>
            </div>
          </div>

        </div>
        <!-- /.container-fluid -->

@endsection
