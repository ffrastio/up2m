<?php

namespace App\Imports;

use App\Models\Pengabdian;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Maatwebsite\Excel\Imports\HeadingRowFormatter;

HeadingRowFormatter::
    default('none');
class FourthSheetImport implements ToCollection, WithHeadingRow
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
        $kategori = "Internal";
        foreach ($rows as $row) {
            if ($row->filter()->isNotEmpty()) {
                Pengabdian::create([
                    'skim_pengabdian' => $row['Skim Pengabdian'] ?? null,
                    'nama_ketua_pengabdian' => $row['Nama Ketua Pengabdian'] ?? null,
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
