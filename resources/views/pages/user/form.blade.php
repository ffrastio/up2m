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

<div class="form-group">
    {!! Form::label('password', 'Password', ['class' => 'control-label']) !!}

    @if ($errors->any())
        {!! Form::password('password',  ($errors->has('password') ? array(null, 'placeholder'=>'Password', 'class'=>'form-control is-invalid') : array(null,'placeholder'=>'Password', 'class'=>'form-control is-valid'))) !!}
    @else
        {!! Form::password('password', array(null, 'placeholder'=>'Password', 'class'=>'form-control',  )) !!}
    @endif
        @if ($errors->has('password'))
            <span class="text-danger">{{$errors->first('password')}}</span>
        @endif
</div>

<div class="form-group">
<label for="password-confirm" class=" col-form-label text-md-right">{{ __('Confirm Password') }}</label>

    <input id="password-confirm" type="password" class="form-control" name="password_confirmation" autocomplete="new-password" placeholder="Confirm password">

</div>

<div class="form-group">
    {!! Form::submit($submitButtonText, ['class' => 'btn btn-primary form-control']) !!}
</div>