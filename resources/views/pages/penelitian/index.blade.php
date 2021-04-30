@extends('layouts.template')

@section('content')

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Data Penelitian</h1>
            <button type="button" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" 
                    data-toggle="modal" data-target="#importExcel">
                <i class="fas fa-plus fa-sm text-white-50"></i> Import Penelitian
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
                      <th>Skim Penelitian</th>
                      <th>Nama Ketua Penelitian</th>
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
                            <td>{{ $item->skim_penelitian}}</td>
                            <td>{{ $item->nama_ketua_penelitian }}</td>
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
				<form method="post" action="/penelitian/import" enctype="multipart/form-data">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Import Data Penelitian</h5>
						</div>
						<div class="modal-body">
 
							{{ csrf_field() }}
 
							<label>Pilih file excel</label>
							<div class="form-group">
								<input type="file" name="file" required="required">
							</div>

              <label>Tahun:</label>
              <div class="form-group">
                <input class="form-control" type="text" name="tahun" id="tahun" required="required">
              </div>

              {{-- @if ($errors->any())
                <div class="form-group {{ $errors->has('kategori') ?
                    'invalid-feedback' : 'valid-feedback' }}"></div>
              @else
                <div class="form-group">
              @endif
                  {!! Form::label('kategori', 'Kategori:', ['class' => 'control-label']) !!}
                  {!! Form::select('kategori', array('DIKTI' => 'DIKTI','Internal' => 'Internal'), null, ['class' => 'form-control',
                    'placeholder' => 'Pilih Kategori']) !!}
                  @if ($errors->has('kategori'))
                      <span class="alert-danger">{{ $errors->first('kategori') }}</span>
                  @endif
                </div> --}}
 
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
