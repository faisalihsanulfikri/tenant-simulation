<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {    
        Schema::create('users', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('name', 191);
            $table->string('foto', 191);
            $table->string('email', 191)->unique();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password', 191);
            $table->string('last_name', 191)->nullable();
            $table->string('first_name', 191)->nullable();
            $table->text('address');
            $table->string('phone_number', 191);
            $table->string('remember_token', 100);
            $table->timestamps();
            $table->softDeletes();
            $table->string('role', 191);
        });

        Schema::create('peserta', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('nama', 30)->nullable();
            $table->string('email', 70)->nullable();
            $table->string('password', 60)->nullable();
            $table->string('nis', 16)->nullable();
            $table->string('gender')->nullable();
            $table->string('code', 30)->nullable();
            $table->string('foto', 191)->nullable();
            $table->bigInteger('updated_by')->nullable()->unsigned();

            $table->softDeletes();
            $table->timestamps();
            $table->foreign('updated_by')->references('id')->on('users')->onDelete('cascade');
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
        Schema::dropIfExists('peserta');
        Schema::dropIfExists('users');
    }
}
