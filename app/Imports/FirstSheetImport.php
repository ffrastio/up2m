<?php

namespace App\Imports;

use App\Models\Penelitian;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Maatwebsite\Excel\Imports\HeadingRowFormatter;

HeadingRowFormatter::
    default('none');
class FirstSheetImport implements ToCollection, WithHeadingRow
{
    /**
     * @param Collection $collection
     */

    public function __construct($tahun)
    {
        $this->tahun = $tahun;
    }

    public function collection(Collection $rows)
    {
        $kategori = "DIKTI";
        foreach ($rows as $row) {
            if ($row->filter()->isNotEmpty()) {
                Penelitian::create([
                    'skim_penelitian' => $row['Skim Penelitian'],
                    'nama_ketua_penelitian' => $row['Nama Ketua Peneliti'] ?? null,
                    'jurusan' => $row['Jurusan'],
                    'judul' => $row['Judul'],
                    'tahun' => $this->tahun,
                    'kategori' => $kategori
                ]);
            }
        }
    }

    public function headingRow(): int
    {
        return 4;
    }
}
