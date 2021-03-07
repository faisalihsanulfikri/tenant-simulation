<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePilihanGandaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        

        Schema::create('pilihan_ganda', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('id_paket')->nullable();
            $table->unsignedBigInteger('id_soal')->nullable();
            $table->integer('no_soal')->nullable();
            $table->text('soal')->nullable();
            $table->text('pilihan_1')->nullable();
            $table->text('pilihan_2')->nullable();
            $table->text('pilihan_3')->nullable();
            $table->text('pilihan_4')->nullable();
            $table->text('pilihan_5')->nullable();
            $table->text('pilihan_6')->nullable();
            $table->text('jawaban_1')->nullable();
            $table->text('jawaban_2')->nullable();
            $table->text('jawaban_3')->nullable();
            $table->text('jawaban_4')->nullable();
            $table->text('jawaban_5')->nullable();
            $table->text('jawaban_6')->nullable();
            $table->unsignedBigInteger('score')->nullable();
            $table->unsignedBigInteger('created_by')->nullable();
            $table->unsignedBigInteger('updated_by')->nullable();
            $table->foreign('created_by')->references('id')->on('users');
            $table->foreign('updated_by')->references('id')->on('users');
            $table->foreign('id_paket')->references('id')->on('paket');
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('pilihan_ganda');
    }
}
