<?php

namespace App\Imports;

use App\Models\Author;
use App\Models\Pengabdian;
use App\Models\Skim;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
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
            'numeric' => 'Baris :attribute harus berisi angka'
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

                if (!isset($row['Skim Pengabdian'])) {
                    return null;
                }
                Skim::updateOrCreate([
                    'skim' => $row['Skim Pengabdian']
                ], [
                    'jenis' => $jenis
                ]);
                Pengabdian::updateOrCreate([
                    'skim_pengabdian' => $row['Skim Pengabdian'] ?? null,
                    'judul' => $row['Judul'],
                    'tahun' => $this->tahun
                ], [
                    'nama_ketua_pengabdian' => $row['Nama Ketua Pengabdian'] ?? null,
                    'jurusan' => $row['Jurusan'],
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
