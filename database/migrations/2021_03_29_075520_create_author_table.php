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
            $table->char('nidn', 10)->unique();
            $table->string('nama', 50);
            $table->string('avatar', 191)->nullable();
            $table->integer('id_jurusan')->unsigned();
            $table->integer('id_prodi')->unsigned();
            $table->timestamps();
        });

        // //set FK di kolom id_author di tabel p2m
        // Schema::table('p2m', function (Blueprint $table) {
        //     $table->foreign('id_author')
        //         ->references('id')
        //         ->on('author')
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
