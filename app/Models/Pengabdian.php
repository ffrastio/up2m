<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pengabdian extends Model
{
    use HasFactory;

    protected $table = 'pengabdian';
    protected $fillable = [
        'skim_pengabdian',
        'nama_ketua_pengabdian',
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
