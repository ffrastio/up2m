@if (isset($author))
    {!! Form::hidden('id', $author->id) !!}
@endif

<div class="form-group">
    {!! Form::label('nidn', 'NIDN', ['class' => 'control-label']) !!}
    @if ($errors->any())
        {!! Form::text('nidn', null, ($errors->has('nidn') ? ['placeholder'=>'Nomor Induk Dosen','class'=>'form-control is-invalid'] : ['placeholder'=>'Nomor Induk Dosen','class'=>'form-control is-valid'] )) !!}
    @else
        {!! Form::text('nidn', null, ['placeholder'=>'Nomor Induk Dosen','class' => 'form-control']) !!}
    @endif
        @if ($errors->has('nidn'))
            <span class="text-danger">{{$errors->first('nidn')}}</span>
        @endif
</div>

<div class="form-group">
    {!! Form::label('nama', 'Nama Lengkap', ['class' => 'control-label']) !!}
    @if ($errors->any())
        {!! Form::text('nama', null, ($errors->has('nama') ? ['placeholder'=>'Nama Lengkap Author','class'=>'form-control is-invalid'] : ['placeholder'=>'Nama Lengkap Author','class'=>'form-control is-valid'] )) !!}
    @else
        {!! Form::text('nama', null, ['placeholder'=>'Nama Lengkap Author','class' => 'form-control']) !!}
    @endif
        @if ($errors->has('nama'))
            <span class="text-danger">{{$errors->first('nama')}}</span>
        @endif
</div>

@if ($errors->any())
    <div class="form-group {{ $errors->has('avatar') ?
       'invalid-feedback' : 'valid-feedback' }}"></div>
@else
    <div class="form-group">
@endif
    {!! Form::label('avatar', 'Avatar:') !!}
    <br>
    {!! Form::file('avatar') !!}
    @if ($errors->has('avatar'))
        <br>
        <span class="alert-danger">{{ $errors->first('avatar') }}</span>
    @endif

    {{-- Menampilkan FOTO --}}
    @if (isset($author))
        @if (isset($author->avatar))
            <img src="{{ asset('fotoupload/'.$author->avatar) }}" width="30%">
        @else
            <img src="{{ asset('fotoupload/no-image.jpg') }}" width="30%">
        @endif
    @endif
    </div>

@if ($errors->any())
    <div class="form-group {{ $errors->has('id_jurusan') ?
       'invalid-feedback' : 'valid-feedback' }}"></div>
@else
    <div class="form-group">
@endif
    {!! Form::label('id_jurusan', 'Jurusan:', ['class' => 'control-label']) !!}
    @if (count($list_jurusan) > 0)
    {!! Form::select('id_jurusan', $list_jurusan, null, ['class' => 'form-control',
    'id' => 'id_jurusan','placeholder' => 'Pilih Jurusan']) !!}
    @else
        <p>Tidak ada pilihan jurusan</p>
    @endif
    @if ($errors->has('id_jurusan'))
        <span class="alert-danger">{{ $errors->first('id_jurusan') }}</span>
    @endif
    </div>

@if ($errors->any())
    <div class="form-group {{ $errors->has('id_prodi') ?
       'invalid-feedback' : 'valid-feedback' }}"></div>
@else
    <div class="form-group">
@endif
    {!! Form::label('id_prodi', 'Prodi:', ['class' => 'control-label']) !!}
    @if (count($list_prodi) > 0)
    {!! Form::select('id_prodi', $list_prodi, null, ['class' => 'form-control',
    'id' => 'id_prodi','placeholder' => 'Pilih Prodi']) !!}
    @else
        <p>Tidak ada pilihan prodi</p>
    @endif
    @if ($errors->has('id_prodi'))
        <span class="alert-danger">{{ $errors->first('id_prodi') }}</span>
    @endif
    </div>

<div class="form-group">
    {!! Form::submit($submitButtonText, ['class' => 'btn btn-primary form-control']) !!}
</div>