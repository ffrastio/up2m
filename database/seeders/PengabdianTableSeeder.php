<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class PengabdianTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $pengabdian = [
            [
                'skim_pengabdian' => "Pengabdian Kepada Masyarakat Berbasis Jurusan",
                'nama_ketua_pengabdian' => "John Noe, S.Tr.com",
                'jurusan' => "Akuntansi",
                'judul' => "Pengabdian internal pertama",
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
                'skim_pengabdian' => "Program Diseminasi",
                'nama_ketua_pengabdian' => "John Noe, S.Tr.com",
                'jurusan' => "Akuntansi",
                'judul' => "Pengabdian DIKTI pertama",
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

        \DB::table('pengabdian')->insert($pengabdian);
    }
}
