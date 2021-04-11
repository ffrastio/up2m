@if (isset($user))
    {!! Form::hidden('id', $user->id) !!}
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
    {!! Form::label('nama', 'Nama Pimpinan', ['class' => 'control-label']) !!}
    @if ($errors->any())
        {!! Form::text('nama', null, ($errors->has('nama') ? ['placeholder'=>'Nama Pimpinan','class'=>'form-control is-invalid'] : ['placeholder'=>'Nama Pimpinan','class'=>'form-control is-valid'] )) !!}
    @else
        {!! Form::text('nama', null, ['placeholder'=>'Nama Pimpinan','class' => 'form-control']) !!}
    @endif
        @if ($errors->has('nama'))
            <span class="text-danger">{{$errors->first('nama')}}</span>
        @endif
</div>

<div class="form-group">
    {!! Form::label('email', 'Email', ['class' => 'control-label']) !!}
    @if ($errors->any())
        {!! Form::text('email', null, ($errors->has('email') ? ['placeholder'=>'email','class'=>'form-control is-invalid'] : ['placeholder'=>'email','class'=>'form-control is-valid'] )) !!}
    @else
        {!! Form::text('email', null, ['placeholder'=>'email','class' => 'form-control']) !!}
    @endif
        @if ($errors->has('email'))
            <span class="text-danger">{{$errors->first('email')}}</span>
        @endif
</div>

@if ($errors->any())
    <div class="form-group {{ $errors->has('profile_photo_path') ?
       'invalid-feedback' : 'valid-feedback' }}"></div>
@else
    <div class="form-group">
@endif
    {!! Form::label('profile_photo_path', 'Foto:') !!}
    <br>
    {!! Form::file('profile_photo_path') !!}
    @if ($errors->has('profile_photo_path'))
        <br>
        <span class="alert-danger">{{ $errors->first('profile_photo_path') }}</span>
    @endif

    {{-- Menampilkan FOTO --}}
    @if (isset($user))
        @if (isset($user->profile_photo_path))
            <img src="{{ asset('fotoupload/'.$user->profile_photo_path) }}" width="30%">
        @else
            <img src="{{ asset('fotoupload/no-image.jpg') }}" width="30%">
        @endif
    @endif
    </div>

<div class="form-group">
    {!! Form::submit($submitButtonText, ['class' => 'btn btn-primary form-control']) !!}
</div>