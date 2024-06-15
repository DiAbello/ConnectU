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
        Schema::create('chats', function (Blueprint $table) {
            $table -> id();
            $table -> unsignedBigInteger('person1');
            $table -> foreign('person1') -> references('id') -> on('users') -> onDelete('cascade') -> onUpdate('cascade');
            $table -> unsignedBigInteger('person2');
            $table -> foreign('person2') -> references('id') -> on('users') -> onDelete('cascade') -> onUpdate('cascade');
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
