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
            $table->string('skim_pengabdian', 191)->nullable();
            $table->string('nama_ketua_pengabdian', 50)->nullable();
            $table->string('jurusan', 50)->nullable();
            $table->string('judul', 255)->nullable();
            $table->text('abstrak')->nullable();
            $table->double('besar_dana', 8, 2)->nullable();
            $table->char('tahun', 4)->nullable();
            $table->enum('kategori', ['Internal', 'DIKTI'])->nullable();
            $table->integer('jumlah_anggota')->nullable();
            $table->string('nama_anggota', 191)->nullable();
            $table->timestamps();
        });

        //set FK di kolom jurusan di tabel pengabdian
        Schema::table('pengabdian', function (Blueprint $table) {
            $table->foreign('jurusan')
                ->references('nama_jurusan')
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
        Schema::dropIfExists('pengabdian');
    }
}
