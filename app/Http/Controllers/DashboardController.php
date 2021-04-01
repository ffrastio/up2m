<?php

namespace App\Http\Controllers;

use App\Models\Jurusan;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function index()
    {
        $jumlah_jurusan = Jurusan::count();
        return view('pages.dashboard.index', compact('jumlah_jurusan'));
    }
}
