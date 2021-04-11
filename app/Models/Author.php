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
        'avatar',
        'id_jurusan',
        'id_prodi'
    ];

    protected $hidden = [
        'created_at',
        'updated_at'
    ];

    public function jurusan()
    {
        return $this->belongsTo('App\Models\Jurusan', 'id_jurusan');
    }

    public function prodi()
    {
        return $this->belongsTo('App\Models\Prodi', 'id_prodi');
    }
}
