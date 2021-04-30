@extends('layouts.template')

@section('content')

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Edit Jurusan</h1>
        </div>
         <div class="card">
                <div class="card-body">
                {!! Form::model($jurusan, ['method' => 'PATCH', 'autocomplete' => 'off', 'files' => true, 'action' => ['JurusanController@update', $jurusan->id]]) !!}
                    @include('pages.jurusan.form', ['submitButtonText' => 'Update'])
                {!! Form::close() !!}
                </div>
         </div>
        </div>
        <!-- /.container-fluid -->

@endsection