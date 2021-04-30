<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSkimTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('skim', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nama_skim', 50);
            $table->integer('id_jenis')->unsigned();
            $table->timestamps();
        });

        //set FK di kolom id_skim di tabel p2m
        Schema::table('p2m', function (Blueprint $table) {
            $table->foreign('id_skim')
                ->references('id')
                ->on('skim')
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
        Schema::dropIfExists('skim');
    }
}
