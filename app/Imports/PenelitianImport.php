<?php

namespace App\Imports;

use App\Models\Penelitian;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithConditionalSheets;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Maatwebsite\Excel\Concerns\WithMultipleSheets;
use Maatwebsite\Excel\Concerns\WithUpserts;
use Maatwebsite\Excel\Imports\HeadingRowFormatter;

HeadingRowFormatter::
    default('none');
class PenelitianImport implements ToCollection, WithHeadingRow, WithMultipleSheets
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
                    'skim_penelitian' => $row['Skim Penelitian'],
                    'nama_ketua_penelitian' => $row['Nama Ketua Penelitian'] ?? null || $row['Nama Ketua Peneliti'] ?? null,
                    'jurusan' => $row['Jurusan'],
                    'judul' => $row['Judul'],
                    'tahun' => $this->tahun
                ]);
            }
        }
    }

    public function headingRow(): int
    {
        return 4;
    }

    // public function uniqueBy()
    // {
    //     return 'judul';
    // }

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
