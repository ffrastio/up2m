<?php

namespace App\Http\Controllers;

use App\Imports\PengabdianImport;
use App\Models\Pengabdian;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Maatwebsite\Excel\Facades\Excel;

class PengabdianController extends Controller
{
    public function index()
    {
        $items = Pengabdian::all()->sortBy('tahun')->whereNotNull('judul');
        return view('pages.pengabdian.index', [
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

        // upload ke folder file_pengabdian di dalam folder public
        $file->move('file_pengabdian', $nama_file);

        // import data
        $import = new PengabdianImport($tahun);
        $import->onlySheets(1, 3);
        Excel::import($import, public_path('/file_pengabdian/' . $nama_file));
        // notifikasi dengan session
        Session::flash('sukses', 'Data Pengabdian Berhasil Diimport!');

        // alihkan halaman kembali
        return redirect('/pengabdian');
    }
}
