<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProdiTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('prodi', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nama_prodi', 50);
            $table->integer('id_jurusan')->unsigned();
            $table->timestamps();
        });

        //set FK di kolom id_prodi di tabel author
        Schema::table('author', function (Blueprint $table) {
            $table->foreign('id_prodi')
                ->references('id')
                ->on('prodi')
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
        Schema::dropIfExists('prodi');
    }
}
