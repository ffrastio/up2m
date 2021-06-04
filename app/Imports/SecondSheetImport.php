<?php

namespace App\Imports;

use App\Models\Author;
use App\Models\Pengabdian;
use App\Models\Skim;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Maatwebsite\Excel\Imports\HeadingRowFormatter;

HeadingRowFormatter::
    default('none');
class SecondSheetImport implements ToCollection, WithHeadingRow
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
        $jenis = "Pengabdian";
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

                if (!isset($row['Skim Pengabdian'])) {
                    return null;
                }
                Skim::updateOrCreate([
                    'skim' => $row['Skim Pengabdian']
                ], [
                    'jenis' => $jenis
                ]);
                Pengabdian::create([
                    'skim_pengabdian' => $row['Skim Pengabdian'] ?? null,
                    'nama_ketua_pengabdian' => $row['Nama Ketua Pengabdian'] ?? null,
                    'jurusan' => $row['Jurusan'],
                    'judul' => $row['Judul'],
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
