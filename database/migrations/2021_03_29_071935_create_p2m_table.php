<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateP2mTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('p2m', function (Blueprint $table) {
            //$table->increments('id');
            //$table->string('judul', 191);
            //$table->text('abstrak');
            $table->string('besar_dana', 50);
            //$table->char('tahun', 4);
            $table->integer('id_author')->unsigned();
            $table->integer('id_kategori')->unsigned();
            $table->integer('id_jenis')->unsigned();
            $table->integer('id_skim')->unsigned();
            $table->integer('id_jurusan')->unsigned();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('p2m');
    }
}
