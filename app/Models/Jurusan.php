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

    public function author()
    {
        return $this->hasMany('App\Models\Author', 'id_jurusan');
    }

    public function prodi()
    {
        return $this->hasMany('App\Models\Prodi', 'id_jurusan');
    }
}
