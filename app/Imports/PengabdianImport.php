<?php

namespace App\Imports;

use App\Models\Pengabdian;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\WithConditionalSheets;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Maatwebsite\Excel\Concerns\WithMultipleSheets;
use Maatwebsite\Excel\Imports\HeadingRowFormatter;

HeadingRowFormatter::
    default('none');
class PengabdianImport implements ToCollection, WithHeadingRow, WithMultipleSheets
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

    public function collection(Collection $rows)
    {
        foreach ($rows as $row) {
            if ($row->filter()->isNotEmpty()) {
                Penelitian::create([
                    'skim_pengabdian' => $row['Skim Pengabdian'] ?? null,
                    'nama_ketua_pengabdian' => $row['Nama Ketua Pengabdian'] ?? null,
                    'jurusan' => $row['Jurusan'],
                    'judul' => $row['Judul'],
                    'besar_dana' => $row['Nominal Dana'] ?? null,
                    'tahun' => $this->tahun
                ]);
            }
        }
    }

    public function headingRow(): int
    {
        return 4;
    }

    use WithConditionalSheets;
    public function conditionalSheets(): array
    {
        return [
            0 => new FirstSheetImport($this->tahun),
            1 => new SecondSheetImport($this->tahun),
            2 => new ThirdSheetImport($this->tahun),
            3 => new FourthSheetImport($this->tahun),
        ];
    }
}
