@extends('layouts.template')

@section('content')

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Edit Author</h1>
        </div>
         <div class="card">
                <div class="card-body">
                {!! Form::model($author, ['method' => 'PATCH', 'autocomplete' => 'off', 'files' => true, 'action' => ['AuthorController@update', $author->id]]) !!}
                    @include('pages.author.form', ['submitButtonText' => 'Update'])
                {!! Form::close() !!}
                </div>
         </div>
        </div>
        <!-- /.container-fluid -->

@endsection