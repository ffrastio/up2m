<?php

namespace App\Imports;

use App\Models\Author;
use App\Models\Penelitian;
use App\Models\Skim;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Maatwebsite\Excel\Imports\HeadingRowFormatter;

HeadingRowFormatter::
    default('none');
class ThirdSheetImport implements ToCollection, WithHeadingRow
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
        $jenis = "Penelitian";
        foreach ($rows as $row) {
            if ($row->filter()->isNotEmpty()) {
                if (!isset($row['Nama'])) {
                    return null;
                }
                Author::updateOrCreate([
                    'nama' => $row['Nama']
                ], [
                    'gelar_depan' => $row['Depan'],
                    'gelar_belakang' => $row['Belakang'],
                    'jurusan' => $row['Jurusan']
                ]);

                if (!isset($row['Skim Penelitian'])) {
                    return null;
                }
                Skim::updateOrCreate([
                    'skim' => $row['Skim Penelitian']
                ], [
                    'jenis' => $jenis
                ]);
                Penelitian::create([
                    'skim_penelitian' => $row['Skim Penelitian'],
                    'nama_ketua_penelitian' => $row['Nama Ketua Penelitian'] ?? null,
                    'jurusan' => $row['Jurusan'] ?? null,
                    'judul' => $row['Judul'],
                    'besar_dana' => $row['Nominal Dana'] ?? null,
                    'tahun' => $this->tahun,
                    'kategori' => $kategori,
                    'nama_author' => $row['Nama']
                ]);
            }
        }
    }

    public function headingRow(): int
    {
        return 4;
    }
}
