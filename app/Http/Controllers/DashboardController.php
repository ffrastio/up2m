<?php

namespace App\Http\Controllers;

use App\Models\Author;
use App\Models\Jurusan;
use App\Models\Penelitian;
use App\Models\Pengabdian;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function index()
    {
        $jml_jurusan = Jurusan::count();
        $jml_author = Author::count();
        $jml_penelitian = Penelitian::count();
        $jml_pengabdian = Pengabdian::count();
        return view(
            'pages.dashboard.index',
            compact('jml_jurusan', 'jml_author', 'jml_penelitian', 'jml_pengabdian')
        );
    }
}
