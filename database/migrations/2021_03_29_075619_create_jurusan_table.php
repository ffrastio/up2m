<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateJurusanTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('jurusan', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('nama_jurusan', 50)->unique();
            $table->string('logo', 191)->nullable();
            $table->timestamps();
        });

        //set FK di kolom jurusan di tabel author
        Schema::table('author', function (Blueprint $table) {
            $table->foreign('jurusan')
                ->references('nama_jurusan')
                ->on('jurusan')
                ->onDelete('cascade')
                ->onUpdate('cascade');
        });

        //set FK di kolom id_jurusan di tabel prodi
        Schema::table('prodi', function (Blueprint $table) {
            $table->foreign('id_jurusan')
                ->references('id')
                ->on('jurusan')
                ->onDelete('cascade')
                ->onUpdate('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('jurusan');
    }
}
