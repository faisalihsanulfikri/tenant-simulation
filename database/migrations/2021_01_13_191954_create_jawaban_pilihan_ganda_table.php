<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateJawabanPilihanGandaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('jawaban_pilihan_ganda', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('id_peserta')->nullable();
            $table->unsignedBigInteger('id_soal')->nullable();
            $table->unsignedBigInteger('id_ujian')->nullable();
            $table->string('jawaban')->nullable();
            $table->string('jawaban_2')->nullable();
            $table->string('jawaban_3')->nullable();
            $table->string('jawaban_4')->nullable();
            $table->string('jawaban_5')->nullable();
            $table->string('jawaban_6')->nullable();
            $table->float('nilai')->nullable();
            $table->foreign('id_soal')->references('id')->on('pilihan_ganda');
            $table->foreign('id_ujian')->references('id')->on('ujian');
            $table->softDeletes();
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
        Schema::dropIfExists('jawaban_pilihan_ganda');
    }
}
