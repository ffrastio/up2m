<?php

namespace App\Imports;

use App\Models\Penelitian;
use Illuminate\Support\Arr;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Maatwebsite\Excel\Concerns\WithMultipleSheets;
use Maatwebsite\Excel\Concerns\WithUpserts;
use Maatwebsite\Excel\Imports\HeadingRowFormatter;

HeadingRowFormatter::
    default('none');
class PenelitianImport implements ToModel, WithHeadingRow, WithUpserts
{
    /**
     * @param array $row
     *
     * @return \Illuminate\Database\Eloquent\Model|null
     */

    public function __construct($tahun)
    {
        $this->tahun = $tahun;
    }

    public function model(array $row)
    {
        return new Penelitian([
            'skim_penelitian' => $row['Skim Penelitian'] ?? null,
            'nama_ketua_penelitian' => $row['Nama Ketua Penelitian'] ?? null,
            'jurusan' => $row['Jurusan'] ?? null,
            'judul' => $row['Judul'] ?? null,
            'tahun' => $this->tahun
        ]);
    }

    public function headingRow(): int
    {
        return 4;
    }

    public function uniqueBy()
    {
        return 'judul';
    }
}
