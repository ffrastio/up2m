<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateJenisP2mTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('jenis_p2m', function (Blueprint $table) {
            $table->increments('id');
            $table->string('jenis', 30);
            $table->timestamps();
        });

        //set FK di kolom id_jenis di tabel p2m
        Schema::table('p2m', function (Blueprint $table) {
            $table->foreign('id_jenis')
                ->references('id')
                ->on('jenis_p2m')
                ->onDelete('cascade')
                ->onUpdate('cascade');
        });

        //set FK di kolom id_jenis di tabel skim
        Schema::table('skim', function (Blueprint $table) {
            $table->foreign('id_jenis')
                ->references('id')
                ->on('jenis_p2m')
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
        Schema::dropIfExists('jenis_p2m');
    }
}
