<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Support\Facades\Hash;
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
        $user->password = Hash::make('12345678');
        $user->isAdmin = 1;
        $user->save();
    }
}
