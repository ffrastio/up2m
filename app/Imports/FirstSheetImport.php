<?php

namespace App\Imports;

use App\Models\Author;
use App\Models\Penelitian;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Maatwebsite\Excel\Concerns\WithMappedCells;
use Maatwebsite\Excel\Concerns\WithUpserts;
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
                if (!isset($row['Skim Penelitian'])) {
                    return null;
                }
                Penelitian::create([
                    'skim_penelitian' => $row['Skim Penelitian'],
                    'nama_ketua_penelitian' => $row['Nama Ketua Peneliti'] ?? null,
                    'jurusan' => $row['Jurusan'] ?? null,
                    'judul' => $row['Judul'],
                    'tahun' => $this->tahun,
                    'kategori' => $kategori
                ]);
            }

            if (!isset($row['Nama'])) {
                return null;
            }
            Author::updateOrCreate([
                'nama' => $row['Nama'],
                'gelar_depan' => $row['Depan'],
                'gelar_belakang' => $row['Belakang'],
                'jurusan' => $row['Jurusan']
            ]);
        }
    }

    public function headingRow(): int
    {
        return 4;
    }
}
