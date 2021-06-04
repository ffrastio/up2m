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
        'nama_author',
    ];

    protected $hidden = [
        'created_at',
        'updated_at'
    ];

    public function setJurusanAttribute($jurusan)
    {
        $this->attributes['jurusan'] = strtolower($jurusan);
    }

    public function getJurusanAttribute($jurusan)
    {
        return strtoupper($jurusan);
    }

    public function jurusan()
    {
        return $this->belongsTo('App\Models\Jurusan', 'nama_jurusan');
    }

    public function author()
    {
        return $this->belongsTo('App\Models\Author', 'nama');
    }

    public function skim()
    {
        return $this->belongsTo('App\Models\Skim', 'skim');
    }
}
