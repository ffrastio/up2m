<?php

namespace App\Http\Controllers;

use App\Models\Author;
use App\Models\Jurusan;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function index()
    {
        $jumlah_jurusan = Jurusan::count();
        $jumlah_author = Author::count();
        return view('pages.dashboard.index', compact('jumlah_jurusan', 'jumlah_author'));
    }
}
