<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Author extends Model
{
    use HasFactory;

    protected $table = 'author';
    protected $fillable = [
        'nidn',
        'nama',
        'gelar_depan',
        'gelar_belakang',
        'avatar',
        'jurusan',
        'id_prodi'
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

    public function prodi()
    {
        return $this->belongsTo('App\Models\Prodi', 'id_prodi');
    }
}
