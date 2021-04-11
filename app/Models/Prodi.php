<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Prodi extends Model
{
    use HasFactory;

    protected $table = 'prodi';
    protected $fillable = [
        'nama_prodi',
        'id_jurusan'
    ];

    protected $hidden = [
        'created_at',
        'updated_at'
    ];

    public function jurusan()
    {
        return $this->belongsTo('App\Models\Jurusan', 'id_jurusan');
    }
}
