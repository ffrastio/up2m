<?php

namespace App\Http\Controllers;

use App\Imports\PenelitianImport;
use App\Models\Penelitian;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Maatwebsite\Excel\Facades\Excel;

class PenelitianController extends Controller
{
    public function index()
    {
        $items = Penelitian::all()->sortBy('tahun')->whereNotNull('judul');
        return view('pages.penelitian.index', [
            'items' => $items,
        ]);
    }

    public function import(Request $request)
    {
        // validasi
        $this->validate($request, [
            'file' => 'required|mimes:csv,xls,xlsx',
            'tahun' => 'required|max:4|string'
        ]);

        // menangkap file excel
        $file = $request->file('file');
        $tahun = $request->tahun;

        // membuat nama file unik
        $nama_file = rand() . $file->getClientOriginalName();

        // upload ke folder file_penelitian di dalam folder public
        $file->move('file_penelitian', $nama_file);

        // import data
        $import = new PenelitianImport($tahun);
        $import->onlySheets(0, 2);
        Excel::import($import, public_path('/file_penelitian/' . $nama_file));
        // notifikasi dengan session
        Session::flash('sukses', 'Data Penelitian Berhasil Diimport!');

        // alihkan halaman kembali
        return redirect('/penelitian');
    }
}
