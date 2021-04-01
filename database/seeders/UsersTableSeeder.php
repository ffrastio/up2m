<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $user = new User;
        $user->nidn = "1234567890";
        $user->nama = "Admin";
        $user->email = "admin@mail.com";
        $user->password = bcrypt('12345678');
        $user->role = "admin";
        $user->save();
    }
}
