@extends('layouts.template')

@section('content')

      <!-- Begin Page Content -->
      <div class="container-fluid">

        <!-- Page Heading -->
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Data Pengabdian</h1>
            <button type="button" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" 
                    data-toggle="modal" data-target="#importExcel">
                <i class="fas fa-plus fa-sm text-white-50"></i> Import Pengabdian
            </button>
        </div>

        {{-- notifikasi form validasi --}}
        @if ($errors->has('file'))
        <span class="invalid-feedback" role="alert">
          <strong>{{ $errors->first('file') }}</strong>
        </span>
        @endif
 
        {{-- notifikasi sukses --}}
        @if ($sukses = Session::get('sukses'))
        <div class="alert alert-success alert-block">
          <button type="button" class="close" data-dismiss="alert">×</button> 
          <strong>{{ $sukses }}</strong>
        </div>
        @endif

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>No</th>
                      <th>Skim Pengabdian</th>
                      <th>Nama Ketua Pengabdian</th>
                      <th>Jurusan</th>
                      <th>Judul</th>
                      <th>Kategori</th>
                      <th>Tahun</th>
                      <th>Action</th>
                    </tr>
                  </thead>
                  <tbody>
                    @php $i=1 @endphp
                    @forelse ($items as $item)
                        <tr>
                            <td>{{ $i++ }}</td>
                            <td>{{ $item->skim_pengabdian}}</td>
                            <td>{{ $item->nama_ketua_pengabdian }}</td>
                            <td>{{ $item->jurusan }}</td>
                            <td>{{ $item->judul }}</td>
                            <td>{{ $item->kategori }}</td>
                            <td>{{ $item->tahun }}</td>
                            <td>
                                {{-- <a href="{{ url('jurusan/' . $item->id . '/edit') }}" class="btn btn-warning">
                                    <i class="fa fa-pencil-alt"></i> Edit Jurusan
                                </a> --}}
                                {{-- <form action="{{ url('jurusan', $item->id) }}" method="post" class="d-inline">
                                    @csrf
                                    @method('delete')
                                    <button class="btn btn-danger">
                                        <i class="fa fa-trash"></i> Hapus Jurusan
                                    </button>
                                </form> --}}
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

      </div>
      <!-- /.container-fluid -->

        <!-- Import Excel -->
		<div class="modal fade" id="importExcel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<form method="post" action="/pengabdian/import" enctype="multipart/form-data">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Import Data Pengabdian</h5>
						</div>
						<div class="modal-body">
 
							{{ csrf_field() }}
 
							<label>Pilih file excel</label>
							<div class="form-group">
								<input type="file" name="file" required="required">
							</div>
 
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
							<button type="submit" class="btn btn-primary">Import</button>
						</div>
					</div>
				</form>
			</div>
		</div>

@endsection
