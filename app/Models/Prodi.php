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
        'jenjang',
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

    public function author()
    {
        return $this->hasMany('App\Models\Author', 'id_prodi');
    }
}
