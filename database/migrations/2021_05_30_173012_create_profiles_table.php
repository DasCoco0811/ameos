<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProfilesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('profiles', function (Blueprint $table) {
            $table->id();
            $table->string('user_id');
            $table->integer('country_id');
            $table->string('avatar');
            $table->string('cover');
            $table->string('profilename', 32);
            $table->text('description', 500);
            $table->string('tagline');
            $table->string('email');
            $table->string('website');
            $table->dateTime('birthday');
            $table->string('occupation', 32);
            $table->enum('status');
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
        Schema::dropIfExists('profiles');
    }
}
