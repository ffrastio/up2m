<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

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

    public function setNamaJurusanAttribute($nama_jurusan)
    {
        $this->attributes['nama_jurusan'] = strtolower($nama_jurusan);
    }

    public function getNamaJurusanAttribute($nama_jurusan)
    {
        return strtoupper($nama_jurusan);
    }

    public function author()
    {
        return $this->hasMany('App\Models\Author', 'jurusan', 'nama_jurusan');
    }

    public function prodi()
    {
        return $this->hasMany('App\Models\Prodi', 'id_jurusan');
    }

    public function penelitian()
    {
        return $this->hasMany('App\Models\Penelitian', 'jurusan', 'nama_jurusan');
    }

    public function pengabdian()
    {
        return $this->hasMany('App\Models\Pengabdian', 'jurusan', 'nama_jurusan');
    }
}
