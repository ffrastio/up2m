<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePengabdianTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('pengabdian', function (Blueprint $table) {
            $table->increments('id');
            $table->string('skim_pengabdian', 191);
            $table->string('nama_ketua_pengabdian', 50);
            $table->string('jurusan', 50);
            $table->string('judul', 191);
            $table->text('abstrak');
            $table->double('besar_dana', 8, 2);
            $table->char('tahun', 4);
            $table->enum('kategori', ['Internal', 'DIKTI']);
            $table->integer('jumlah_anggota');
            $table->string('nama_anggota', 191);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('pengabdian');
    }
}
