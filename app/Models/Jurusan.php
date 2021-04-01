<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Jurusan extends Model
{
    use HasFactory;

    protected $table = 'jurusan';
    protected $fillable = [
        'nama_jurusan',
        'logo'
    ];

    protected $hidden = [
        'created_at',
        'updated_at'
    ];
}
