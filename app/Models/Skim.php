<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Skim extends Model
{
    use HasFactory;

    protected $table = 'skim';
    protected $fillable = [
        'skim',
        'jenis'
    ];

    protected $hidden = [
        'created_at',
        'updated_at'
    ];

    public function penelitian()
    {
        return $this->hasMany('App\Models\Penelitian', 'skim_penelitian', 'skim');
    }

    public function pengabdian()
    {
        return $this->hasMany('App\Models\Pengabdian', 'skim_pengabdian', 'skim');
    }
}
