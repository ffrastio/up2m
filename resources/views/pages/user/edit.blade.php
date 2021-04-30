@extends('layouts.template')

@section('content')

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Edit Pengguna</h1>
            {{-- <a href="{{ route('password.edit') }}" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
              <i class="fa fa-pencil-alt"></i> Edit Password
          </a> --}}
        </div>
         <div class="card">
                <div class="card-body">
                {!! Form::model($user, ['method' => 'PATCH', 'autocomplete' => 'off', 'files' => true, 'action' => ['UserController@update', $user->id]]) !!}
                    @include('pages.user.formedit', ['submitButtonText' => 'Update'])
                {!! Form::close() !!}
                </div>
         </div>
        </div>
        <!-- /.container-fluid -->

@endsection