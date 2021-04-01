<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class KategoriTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $kategori = [
            [
                'kategori' => "Internal",
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],
            [
                'kategori' => "DIKTI",
                'created_at' => new \DateTime,
                'updated_at' => null,
            ],

        ];

        \DB::table('kategori')->insert($kategori);
    }
}
