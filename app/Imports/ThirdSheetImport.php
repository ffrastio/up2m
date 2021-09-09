<?php

namespace App\Imports;

use App\Models\Author;
use App\Models\Penelitian;
use App\Models\Skim;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
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
        $jurusan = [
            'Administrasi Niaga', 'Akuntansi', 'Teknik Elektro',
            'Teknik Mesin', 'Teknik Grafika dan Penerbitan', 'Teknik Informatika dan Komputer', 'Teknik Sipil',
            'Direktorat', 'Pasca Sarjana', 'Teknik Grafika Dan Penerbitan', 'Teknik Informatika Dan Komputer',
            'ADMINISTRASI NIAGA', 'AKUNTANSI', 'TEKNIK ELEKTRO', 'TEKNIK MESIN',
            'TEKNIK GRAFIKA DAN PENERBITAN', 'TEKNIK INFORMATIKA DAN KOMPUTER', 'TEKNIK SIPIL',
            'DIREKTORAT', 'PASCA SARJANA'
        ];
        Validator::make($rows->toArray(), [
            '*.Jurusan' => ['nullable', 'sometimes', Rule::in($jurusan)],
            '*.Nominal Dana' => ['nullable', 'sometimes', 'numeric']
        ], [
            'in' => 'Baris :attribute berisi value yang salah',
            'numeric' => 'Baris :attribute Dana harus berisi angka'
        ])->validate();

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
                Penelitian::updateOrCreate([
                    'skim_penelitian' => $row['Skim Penelitian'],
                    'judul' => $row['Judul'],
                    'tahun' => $this->tahun

                ], [
                    'nama_ketua_penelitian' => $row['Nama Ketua Penelitian'] ?? null,
                    'jurusan' => $row['Jurusan'] ?? null,
                    'besar_dana' => $row['Nominal Dana'] ?? null,
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
