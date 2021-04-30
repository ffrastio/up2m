@extends('layouts.template')

@section('content')
    <div class="container-fluid">
          <!-- Page Heading -->
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Tambah Pengguna</h1>
        </div>

        <div class="card">
            <div class="card-body">
                {!! Form::open(['url' => 'user', 'files' => true]) !!}
                    @include('pages.user.form', ['submitButtonText' => 'Simpan'])
                {!! Form::close() !!}
            </div>
        </div>
    </div>
@endsection
