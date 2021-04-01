<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class JenisTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $jenis = [
            [
                'jenis' => "Penelitian",
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],
            [
                'jenis' => "Pengabdian Masyarakat",
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],

        ];

        \DB::table('jenis_p2m')->insert($jenis);
    }
}
