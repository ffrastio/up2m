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
                'nama_jurusan' => "administrasi niaga",
                'logo' => null,
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],
            [
                'nama_jurusan' => "akuntansi",
                'logo' => null,
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],
            [
                'nama_jurusan' => "teknik elektro",
                'logo' => null,
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],
            [
                'nama_jurusan' => "teknik grafika dan penerbitan",
                'logo' => null,
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],
            [
                'nama_jurusan' => "teknik informatika dan komputer",
                'logo' => null,
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],
            [
                'nama_jurusan' => "teknik mesin",
                'logo' => null,
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],
            [
                'nama_jurusan' => "teknik sipil",
                'logo' => null,
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],
            [
                'nama_jurusan' => "p3m",
                'logo' => null,
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],

        ];

        \DB::table('jurusan')->insert($jurusan);
    }
}
