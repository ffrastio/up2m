<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class JurusanTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $jurusan = [
            [
                'nama_jurusan' => "Administrasi Niaga",
                'logo' => null,
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],
            [
                'nama_jurusan' => "Akuntansi",
                'logo' => null,
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],
            [
                'nama_jurusan' => "Teknik Elektro",
                'logo' => null,
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],
            [
                'nama_jurusan' => "Teknik Grafika dan Penerbitan",
                'logo' => null,
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],
            [
                'nama_jurusan' => "Teknik Informatika dan Komputer",
                'logo' => null,
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],
            [
                'nama_jurusan' => "Teknik Mesin",
                'logo' => null,
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],
            [
                'nama_jurusan' => "Teknik Sipil",
                'logo' => null,
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],
            [
                'nama_jurusan' => "MTTE",
                'logo' => null,
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],
            [
                'nama_jurusan' => "P3M",
                'logo' => null,
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],
            [
                'nama_jurusan' => "Manajemen Pemasaran (WNBK)",
                'logo' => null,
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],

        ];

        \DB::table('jurusan')->insert($jurusan);
    }
}
