<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAuthorTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('author', function (Blueprint $table) {
            $table->increments('id');
            $table->char('nidn', 10)->nullable();
            $table->string('nama', 191)->nullable();
            $table->string('gelar_depan', 50)->nullable();
            $table->string('gelar_belakang', 50)->nullable();
            $table->string('avatar', 191)->nullable();
            $table->string('jurusan', 50)->nullable();
            $table->integer('id_prodi')->unsigned()->nullable();
            $table->timestamps();
        });

        // //set FK di kolom jurusan di tabel author
        // Schema::table('author', function (Blueprint $table) {
        //     $table->foreign('jurusan')
        //         ->references('nama_jurusan')
        //         ->on('jurusan')
        //         ->onDelete('cascade')
        //         ->onUpdate('cascade');
        // });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('author');
    }
}
