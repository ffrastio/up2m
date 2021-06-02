<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePenelitianTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('penelitian', function (Blueprint $table) {
            $table->increments('id');
            $table->string('skim_penelitian', 191)->nullable();
            $table->string('nama_ketua_penelitian', 191)->nullable();
            $table->string('jurusan', 50);
            $table->text('judul');
            $table->text('abstrak')->nullable();
            $table->double('besar_dana', 8, 2)->nullable();
            $table->char('tahun', 4);
            $table->enum('kategori', ['Internal', 'DIKTI']);
            $table->string('nama_anggota', 191)->nullable();
            $table->timestamps();
        });

        //set FK di kolom jurusan dan nama_ketua_penelitian di tabel penelitian
        Schema::table('penelitian', function (Blueprint $table) {
            $table->foreign('jurusan')
                ->references('nama_jurusan')
                ->on('jurusan')
                ->onDelete('cascade')
                ->onUpdate('cascade');

            $table->foreign('nama_ketua_penelitian')
                ->references('nama')
                ->on('author')
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
        Schema::dropIfExists('penelitian');
    }
}
