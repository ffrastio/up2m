<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class PenelitianTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $penelitian = [
            [
                'skim_penelitian' => "Penelitian Produk Terapan",
                'nama_ketua_penelitian' => "John Doe, S.Tr.com",
                'jurusan' => "Administrasi Niaga",
                'judul' => "Penelitian internal pertama",
                'abstrak' => "",
                'besar_dana' => 20000000,
                'tahun' => "2018",
                'kategori' => "Internal",
                'jumlah_anggota' => 0,
                'nama_anggota' => "",
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],
            [
                'skim_penelitian' => "Penelitian Hibah Kompetensi",
                'nama_ketua_penelitian' => "John Doe, S.Tr.com",
                'jurusan' => "Administrasi Niaga",
                'judul' => "Penelitian DIKTI pertama",
                'abstrak' => "",
                'besar_dana' => 20000000,
                'tahun' => "2018",
                'kategori' => "DIKTI",
                'jumlah_anggota' => 0,
                'nama_anggota' => "",
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],

        ];

        \DB::table('penelitian')->insert($penelitian);
    }
}
