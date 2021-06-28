@extends('layouts.template')

@section('content')

    <!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- Page Heading -->
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Edit Penelitian</h1>
        </div>
        <div class="card">
            <div class="card-body">
                {!! Form::model($penelitian, ['method' => 'PATCH', 'autocomplete' => 'off', 'files' => true, 'action' => ['PenelitianController@update', $penelitian->id]]) !!}
                @if (isset($penelitian))
                    {!! Form::hidden('id', $penelitian->id) !!}
                @endif

                <div class="form-group">
                    {!! Form::label('skim_penelitian', 'Skim Penelitian', ['class' => 'control-label']) !!}
                    @if ($errors->any())
                        {!! Form::text('skim_penelitian', null, $errors->has('skim_penelitian') ? ['class' => 'form-control is-invalid'] : ['class' => 'form-control is-valid']) !!}
                    @else
                        {!! Form::text('skim_penelitian', null, ['class' => 'form-control', 'disabled' => 'disabled']) !!}
                    @endif
                    @if ($errors->has('skim_penelitian'))
                        <span class="text-danger">{{ $errors->first('skim_penelitian') }}</span>
                    @endif
                </div>

                <div class="form-group">
                    {!! Form::label('judul', 'Judul', ['class' => 'control-label']) !!}
                    @if ($errors->any())
                        {!! Form::textarea('judul', null, $errors->has('judul') ? ['class' => 'form-control is-invalid'] : ['class' => 'form-control is-valid']) !!}
                    @else
                        {!! Form::textarea('judul', null, ['class' => 'form-control', 'disabled' => 'disabled']) !!}
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
                        {!! Form::number('besar_dana', null, $errors->has('besar_dana') ? ['class' => 'form-control is-invalid'] : ['class' => 'form-control is-valid']) !!}
                    @else
                        {!! Form::number('besar_dana', null, ['class' => 'form-control']) !!}
                    @endif
                    @if ($errors->has('besar_dana'))
                        <span class="text-danger">{{ $errors->first('besar_dana') }}</span>
                    @endif
                </div>

                <div class="form-group">
                    {!! Form::submit('Update', ['class' => 'btn btn-primary form-control']) !!}
                </div>
                {!! Form::close() !!}
            </div>
        </div>
    </div>
    <!-- /.container-fluid -->

@endsection
