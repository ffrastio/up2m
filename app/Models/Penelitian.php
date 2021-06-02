<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class Penelitian extends Model
{
    use HasFactory, Notifiable, HasApiTokens;

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
}
