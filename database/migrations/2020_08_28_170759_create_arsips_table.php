<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateArsipsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('arsips', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('no');
            $table->integer('nim');
            $table->string('nama');
            $table->string('batch');
            $table->string('prodi');
            $table->string('upbjj');
            $table->integer('yudisium');
            $table->string('kelengkapan');
            $table->string('foto');
            $table->string('kirim');
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
        Schema::dropIfExists('arsips');
    }
}
