@extends('layouts.template')

@section('content')

    <!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- Page Heading -->
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Tambah Penelitian</h1>
        </div>
        <div class="card">
            <div class="card-body">
                {!! Form::open(['url' => 'penelitian', 'files' => true]) !!}

                <div class="form-group">
                    {!! Form::label('skim_penelitian', 'Skim Penelitian', ['class' => 'control-label']) !!}
                    @if ($list_skim)
                        {!! Form::select('skim_penelitian', $list_skim, null, ['class' => 'form-control', 'placeholder' => 'Pilih Skim']) !!}
                    @else
                        <p>Tidak ada pilihan skim</p>
                    @endif
                    @if ($errors->has('skim_penelitian'))
                        <span class="text-danger">{{ $errors->first('skim_penelitian') }}</span>
                    @endif
                </div>

                <div class="form-group">
                    {!! Form::label('nama_ketua_penelitian', 'Nama Ketua Penelitian', ['class' => 'control-label']) !!}
                    @if ($errors->any())
                        {!! Form::text('nama_ketua_penelitian', null, $errors->has('nama_ketua_penelitian') ? ['id' => 'nama_ketua_penelitian', 'placeholder' => 'Masukkan nama lengkap', 'class' => 'form-control is-invalid'] : ['id' => 'nama_ketua_penelitian', 'placeholder' => 'Masukkan nama lengkap', 'class' => 'form-control is-valid']) !!}
                    @else
                        {!! Form::text('nama_ketua_penelitian', null, ['id' => 'nama_ketua_penelitian', 'placeholder' => 'Masukkan nama lengkap', 'class' => 'form-control']) !!}
                    @endif
                    <div id="authorList" class="float-left shadow animated--grow-in" aria-labelledby="userDropdown">
                    </div>
                    <span class="form-text text-muted"><i><b>Note:</b> Nama lengkap ketua penelitian</i></span><br>
                    @if ($errors->has('nama_ketua_penelitian'))
                        <span class="text-danger">{{ $errors->first('nama_ketua_penelitian') }}</span>
                    @endif
                </div>

                <div class="form-group">
                    {!! Form::label('jurusan', 'Jurusan', ['class' => 'control-label']) !!}
                    @if ($list_jurusan)
                        {!! Form::select('jurusan', $list_jurusan, null, ['class' => 'form-control', 'placeholder' => 'Pilih Jurusan']) !!}
                    @else
                        <p>Tidak ada pilihan jurusan</p>
                    @endif
                    @if ($errors->has('jurusan'))
                        <span class="text-danger">{{ $errors->first('jurusan') }}</span>
                    @endif
                </div>

                <div class="form-group">
                    {!! Form::label('judul', 'Judul', ['class' => 'control-label']) !!}
                    @if ($errors->any())
                        {!! Form::textarea('judul', null, $errors->has('judul') ? ['class' => 'form-control is-invalid'] : ['class' => 'form-control is-valid']) !!}
                    @else
                        {!! Form::textarea('judul', null, ['class' => 'form-control']) !!}
                    @endif
                    @if ($errors->has('judul'))
                        <span class="text-danger">{{ $errors->first('judul') }}</span>
                    @endif
                </div>

                <div class="form-group">
                    {!! Form::label('abstrak', 'Abstrak', ['class' => 'control-label']) !!}
                    @if ($errors->any())
                        {!! Form::textarea('abstrak', null, $errors->has('abstrak') ? ['class' => 'form-control is-invalid'] : ['class' => 'form-control is-valid']) !!}
                    @else
                        {!! Form::textarea('abstrak', null, ['class' => 'form-control']) !!}
                    @endif
                    @if ($errors->has('abstrak'))
                        <span class="text-danger">{{ $errors->first('abstrak') }}</span>
                    @endif
                </div>

                <div class="form-group">
                    {!! Form::label('besar_dana', 'Nominal Dana', ['class' => 'control-label']) !!}
                    @if ($errors->any())
                        {!! Form::number('besar_dana', null, $errors->has('besar_dana') ? ['placeholder' => '1xxxxxxx', 'class' => 'form-control is-invalid'] : ['class' => 'form-control is-valid']) !!}
                    @else
                        {!! Form::number('besar_dana', null, ['placeholder' => '1xxxxxxx', 'class' => 'form-control']) !!}
                    @endif
                    @if ($errors->has('besar_dana'))
                        <span class="text-danger">{{ $errors->first('besar_dana') }}</span>
                    @endif
                </div>

                <div class="form-group">
                    {!! Form::label('tahun', 'Tahun', ['class' => 'control-label']) !!}
                    @if ($errors->any())
                        {!! Form::text('tahun', null, $errors->has('tahun') ? ['placeholder' => 'yyyy', 'class' => 'form-control is-invalid'] : ['class' => 'form-control is-valid']) !!}
                    @else
                        {!! Form::text('tahun', null, ['placeholder' => 'yyyy', 'class' => 'form-control']) !!}
                    @endif
                    @if ($errors->has('tahun'))
                        <span class="text-danger">{{ $errors->first('tahun') }}</span>
                    @endif
                </div>

                <div class="form-group">
                    {!! Form::label('kategori', 'Kategori:', ['class' => 'control-label']) !!}
                    @if ($errors->any())
                        {!! Form::select('kategori', ['Internal' => 'Internal', 'DIKTI' => 'DIKTI'], null, ['class' => 'form-control', 'placeholder' => 'Pilih Kategori']) !!}
                    @else
                        {!! Form::select('kategori', ['Internal' => 'Internal', 'DIKTI' => 'DIKTI'], null, ['class' => 'form-control', 'placeholder' => 'Pilih Kategori']) !!}
                    @endif
                    @if ($errors->has('kategori'))
                        <span class="text-danger">{{ $errors->first('kategori') }}</span>
                    @endif
                </div>

                <div class="form-group">
                    {!! Form::label('nama_anggota', 'Nama Anggota', ['class' => 'control-label']) !!}
                    @if ($errors->any())
                        {!! Form::text('nama_anggota', null, $errors->has('nama_anggota') ? ['placeholder' => 'Masukkan nama lengkap', 'class' => 'form-control is-invalid'] : ['placeholder' => 'Masukkan nama lengkap', 'class' => 'form-control is-valid']) !!}
                    @else
                        {!! Form::text('nama_anggota', null, ['placeholder' => 'Masukkan nama lengkap', 'class' => 'form-control']) !!}
                    @endif
                    <span class="form-text text-muted"><i><b>Note:</b> Jika lebih dari satu pisahkan dengan tanda koma
                            (,)</i></span><br>
                    @if ($errors->has('nama_anggota'))
                        <span class="text-danger">{{ $errors->first('nama_anggota') }}</span>
                    @endif
                </div>

                <div class="form-group">
                    {!! Form::submit('Simpan', ['class' => 'btn btn-primary form-control']) !!}
                </div>
                {!! Form::close() !!}
            </div>
        </div>
    </div>
    <!-- /.container-fluid -->
    <!-- /.fetch nama author -->
    <script>
        window.onload = function() {
            $(document).ready(function() {

                $('#nama_ketua_penelitian').keyup(function() {
                    var query = $(this).val();
                    if (query != '') {
                        var _token = $('input[name="_token"]').val();
                        $.ajax({
                            url: "{{ route('fetch') }}",
                            method: "POST",
                            data: {
                                query: query,
                                _token: _token
                            },
                            success: function(data) {
                                $('#authorList').fadeIn();
                                $('#authorList').html(data);
                            }
                        });
                    } else {
                        $('#authorList').fadeOut();
                    }
                });

                $(document).on('click', 'li', function() {
                    $('#nama_ketua_penelitian').val($(this).text());
                    $('#authorList').fadeOut();
                });

            });
        }
    </script>
@endsection
