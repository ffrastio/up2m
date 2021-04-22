<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Penelitian extends Model
{
    use HasFactory;

    protected $table = 'penelitian';
    protected $fillable = [
        'skim_penelitian',
        'nama_ketua_penelitian',
        'jurusan',
        'judul',
        'abstrak',
        'besar_dana',
        'tahun',
        'kategori',
        'jumlah_anggota',
        'nama_anggota',
    ];

    protected $hidden = [
        'created_at',
        'updated_at'
    ];
}
