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
        Schema::create('Reports', function (Blueprint $table) {
            $table -> id();
            $table -> unsignedBigInteger('report_sender');
            $table -> foreign('report_sender') -> references('id') -> on('users') -> onDelete('cascade') -> onUpdate('cascade');
            $table -> unsignedBigInteger('report_offending');
            $table -> foreign('report_offending') -> references('id') -> on('users') -> onDelete('cascade') -> onUpdate('cascade');
            $table -> string('content');
            $table -> timestamp('timestamp');
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
