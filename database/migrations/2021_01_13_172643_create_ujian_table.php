<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateUjianTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('paket', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('nama_paket');
            $table->timestamps();
            $table->softDeletes();
        });

        Schema::create('sertifikasi', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('jenis_ujian', 191);
            $table->date('tgl_ujian');
            $table->string('jam_mulai', 30);
            $table->string('id_guru', 20);
            $table->string('id_guru2', 20);
            $table->bigInteger('id_paket_soal')->unsigned();
            $table->bigInteger('created_by')->unsigned();
            $table->bigInteger('updated_by')->unsigned()->nullable();
            $table->string('jenis_sertifikasi', 191)->nullable();
            $table->string('durasi',10)->nullable();
            $table->text('laporan_hambatan')->nullable();
            $table->tinyInteger('sesi')->nullable();
            $table->string('kelas', 191)->nullable();
            $table->string('lokasi', 191)->nullable();
            $table->string('token', 30)->nullable();

            $table->softDeletes();
            $table->timestamps();

            $table->foreign('id_paket_soal')->references('id')->on('paket');
            $table->foreign('created_by')->references('id')->on('users');
            $table->foreign('updated_by')->references('id')->on('users');
        });

        Schema::create('ujian', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('id_peserta', 20);
            $table->bigInteger('id_sertifikasi')->unsigned();
            $table->string('nilai');
            $table->bigInteger('created_by')->unsigned();
            $table->bigInteger('updated_by')->unsigned()->nullable();
            $table->softDeletes();
            $table->timestamps();
            $table->float('nilai_diri1')->default(0);
            $table->float('nilai_diri2')->default(0);
            $table->float('nilai_praktek1')->default(0);
            $table->float('nilai_praktek2')->default(0);
            $table->float('nilai_ujian')->default(0);
            $table->float('total_nilai')->default(0);
            $table->string('status', 30)->default('Belum Diisi');
            $table->string('status_dd', 30);
            $table->string('catatan1', 191);
            $table->string('catatan2', 191);

            $table->foreign('id_sertifikasi')->references('id')->on('sertifikasi');
            $table->foreign('created_by')->references('id')->on('users');
            $table->foreign('updated_by')->references('id')->on('users');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('ujian');
        Schema::dropIfExists('sertifikasi');
        Schema::dropIfExists('paket');
    }
}
