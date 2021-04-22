<?php

namespace App\Imports;

use App\Pengabdian;
use Maatwebsite\Excel\Concerns\ToModel;

class PengabdianImport implements ToModel
{
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function model(array $row)
    {
        return new Pengabdian([
            //
        ]);
    }
}
