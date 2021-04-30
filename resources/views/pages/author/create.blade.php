@extends('layouts.template')

@section('content')
    <div class="container-fluid">
          <!-- Page Heading -->
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Tambah Author</h1>
        </div>

        <div class="card">
            <div class="card-body">
                {!! Form::open(['url' => 'author', 'files' => true]) !!}
                    @include('pages.author.form', ['submitButtonText' => 'Simpan'])
                {!! Form::close() !!}
            </div>
        </div>
    </div>
@endsection