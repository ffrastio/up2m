<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class SkimTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $skim = [
            [
                'nama_skim' => "Administrasi Niaga",
                'id_jenis' => null,
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],
            [
                'nama_skim' => "Akuntansi",
                'id_jenis' => null,
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],
            [
                'nama_skim' => "Teknik Elektro",
                'id_jenis' => null,
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],
            [
                'nama_skim' => "Teknik Grafika dan Penerbitan",
                'id_jenis' => null,
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],
            [
                'nama_skim' => "Teknik Informatika dan Komputer",
                'id_jenis' => null,
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],
            [
                'nama_skim' => "Teknik Mesin",
                'id_jenis' => null,
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],
            [
                'nama_skim' => "Teknik Sipil",
                'id_jenis' => null,
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],
            [
                'nama_skim' => "MTTE",
                'id_jenis' => null,
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],
            [
                'nama_skim' => "P3M",
                'id_jenis' => null,
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],
            [
                'nama_skim' => "Manajemen Pemasaran (WNBK)",
                'id_jenis' => null,
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],

        ];

        \DB::table('skim')->insert($skim);
    }
}
