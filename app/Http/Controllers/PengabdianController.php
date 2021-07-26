<?php

namespace App\Http\Controllers;

use App\Http\Requests\ImportRequest;
use App\Http\Requests\PengabdianRequest;
use App\Imports\PengabdianImport;
use App\Models\Pengabdian;
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

    public function show($id)
    {
        $pengabdian = Pengabdian::findOrFail($id);

        return view('pages.pengabdian.show', compact('pengabdian'));
    }

    public function edit($id)
    {
        $pengabdian = Pengabdian::findOrFail($id);

        return view('pages.pengabdian.edit', compact('pengabdian'));
    }

    public function update(Pengabdian $pengabdian, PengabdianRequest $request)
    {
        $data = $request->all();

        //update data pengabdian
        $pengabdian->update($data);
        Session::flash('sukses', 'Berhasil update data pengabdian');

        return redirect('/pengabdian');
    }

    public function import(ImportRequest $request)
    {
        try {
            // menangkap file excel
            $file = $request->file('file');
            $tahun = $request->tahun;

            // membuat nama file
            $nama_file = $file->getClientOriginalName();

            // upload ke folder file_pengabdian di dalam folder public
            $file->storeAs('public/file_pengabdian', $nama_file);

            // import data
            $import = new PengabdianImport($tahun);
            $import->onlySheets(1, 3);
            Excel::import($import, storage_path('app/public/file_pengabdian/' . $nama_file));
            // notifikasi dengan session
            Session::flash('sukses', 'Data Pengabdian Tahun ' . $tahun . ' Berhasil Diimport!');

            // alihkan halaman kembali
            return redirect('/pengabdian');
        } catch (\Maatwebsite\Excel\Validators\ValidationException $e) {
            $e->errors();
            // foreach ($failures->failures() as $failure) {
            //     $failure->row(); // row that went wrong
            //     $failure->attribute(); // either heading key (if using heading row concern) or column index
            //     $failure->errors(); // Actual error messages from Laravel validator
            //     $failure->values(); // The values of the row that has failed.
            // }
            Session::flash('gagal', 'Data Pengabdian Tahun ' . $tahun . ' Gagal import!');
            return redirect('/pengabdian');
        }
    }
}
