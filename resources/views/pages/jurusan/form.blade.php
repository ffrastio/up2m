@if (isset($jurusan))
    {!! Form::hidden('id', $jurusan->id) !!}
@endif

<div class="form-group">
    {!! Form::label('nama_jurusan', 'Nama Jurusan', ['class' => 'control-label']) !!}
    @if ($errors->any())
        {!! Form::text('nama_jurusan', null, $errors->has('nama_jurusan') ? ['placeholder' => 'Teknik...', 'class' => 'form-control is-invalid'] : ['placeholder' => 'Teknik...', 'class' => 'form-control is-valid']) !!}
    @else
        {!! Form::text('nama_jurusan', null, ['placeholder' => 'Teknik...', 'class' => 'form-control']) !!}
    @endif
    @if ($errors->has('nama_jurusan'))
        <span class="text-danger">{{ $errors->first('nama_jurusan') }}</span>
    @endif
</div>

<div class="form-group">
    {!! Form::label('logo', 'Logo:') !!}
    <br>
    {!! Form::file('logo') !!}
    @if ($errors->has('logo'))
        <br>
        <span class="text-danger">{{ $errors->first('logo') }}</span>
    @endif

    {{-- Menampilkan FOTO --}}
    @if (isset($jurusan))
        @if (isset($jurusan->logo))
            <img src="{{ Storage::url($jurusan->logo) }}" width="30%">
        @else
            <img src="{{ asset('fotoupload/no-image.jpg') }}" width="30%">
        @endif
    @endif
</div>

<div class="form-group">
    {!! Form::submit($submitButtonText, ['class' => 'btn btn-primary form-control']) !!}
</div>
