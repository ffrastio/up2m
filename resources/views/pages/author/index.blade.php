@extends('layouts.template')
@section('content')
    <!-- Begin Page Content -->
    <div class="container-fluid">
        <!-- Page Heading -->
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Daftar Author</h1>
            <a href="{{ url('/author/create') }}" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
                <i class="fas fa-plus fa-sm text-white-50"></i> Tambah Author
            </a>
        </div>

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                        <th>NIDN</th>
                      <th>Nama</th>
                      <th>Gelar Depan</th>
                      <th>Gelar Belakang</th>
                        {{-- <th>Jurusan</th>
                        <th>Prodi</th> --}}
                      <th>Avatar</th>
                      <th>Action</th>
                    </tr>
                  </thead>
                  <tbody>
                    @forelse ($items as $item)
                        <tr>
                            <td>{{ $item->nidn}}</td>
                            <td>{{ $item->nama}}</td>
                            <td>{{ $item->gelar_depan }}</td>
                            <td>{{ $item->gelar_belakang }}</td>
                            {{-- <td>{{ $item->jurusan->nama_jurusan}}</td>
                            <td>{{ $item->prodi->nama_prodi }}</td> --}}
                            <td>
                              @if (isset($item))
                                    @if (isset($item->avatar))
                                        <img src="{{ asset('fotoupload/'.$item->avatar) }}" width="80px">
                                    @else
                                        <img src="{{ asset('fotoupload/no-image.jpg') }}" width="80px">
                                    @endif
                                @endif
                            </td>
                            <td>
                                <a href="{{ url('author/' . $item->id . '/edit') }}" class="btn btn-warning">
                                    <i class="fa fa-pencil-alt"></i> Edit
                                </a>
                                <form action="{{ url('author', $item->id) }}" method="post" class="d-inline">
                                    @csrf
                                    @method('delete')
                                    <button class="btn btn-danger">
                                        <i class="fa fa-trash"></i> Hapus
                                    </button>
                                </form>
                            </td>
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
           <!-- DataTales Example End -->
    </div>
@endsection