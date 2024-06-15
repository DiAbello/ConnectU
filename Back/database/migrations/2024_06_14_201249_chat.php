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
        Schema::create('chat', function (Blueprint $table) {
            $table -> unsignedBigInteger('chat_id');
            $table -> foreign('chat_id') -> references('id') -> on('chats') -> onDelete('cascade') -> onUpdate('cascade');
            $table -> unsignedBigInteger('user_id');
            $table -> foreign('user_id') -> references('id') -> on('users') -> onDelete('cascade') -> onUpdate('cascade');
            $table -> string('content');
            $table -> timestamp('send_at');
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
