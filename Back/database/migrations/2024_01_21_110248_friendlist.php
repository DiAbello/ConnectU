<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('friendlist', function (Blueprint $table) {
            $table -> unsignedBigInteger('person1');
            $table -> foreign('person1') -> references('id') -> on('users');
            $table -> unsignedBigInteger('person2');
            $table -> foreign('person2') -> references('id') -> on('users');
            $table -> boolean('friend_status') -> default(0);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        //
    }
};
