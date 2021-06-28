<?php

namespace App\Http\Controllers;

use App\Http\Requests\ImportRequest;
use App\Http\Requests\PenelitianRequest;
use App\Imports\PenelitianImport;
use App\Models\Penelitian;
use Illuminate\Support\Facades\Session;
use Maatwebsite\Excel\Facades\Excel;

class PenelitianController extends Controller
{
    public function index()
    {
        $items = Penelitian::all()->sortBy('tahun');
        return view('pages.penelitian.index', [
            'items' => $items,
        ]);
    }

    public function show($id)
    {
        $penelitian = Penelitian::findOrFail($id);

        return view('pages.penelitian.show', compact('penelitian'));
    }

    public function edit($id)
    {
        $penelitian = Penelitian::findOrFail($id);

        return view('pages.penelitian.edit', compact('penelitian'));
    }

    public function update(Penelitian $penelitian, PenelitianRequest $request)
    {
        $data = $request->all();

        //update data penelitian
        $penelitian->update($data);
        Session::flash('sukses', 'Berhasil update data penelitian');

        return redirect('/penelitian');
    }

    public function import(ImportRequest $request)
    {
        // menangkap file excel
        $file = $request->file('file');
        $tahun = $request->tahun;

        // membuat nama file unik
        $nama_file = rand() . $file->getClientOriginalName();

        // upload ke folder file_penelitian di dalam folder storage/public
        $file->storeAs('public/file_penelitian', $nama_file);

        // import data
        $import = new PenelitianImport($tahun);
        $import->onlySheets(0, 2);
        Excel::import($import, storage_path('app/public/file_penelitian/' . $nama_file));
        // notifikasi dengan session
        Session::flash('sukses', 'Data Penelitian Tahun ' . $tahun . ' Berhasil Diimport!');

        // alihkan halaman kembali
        return redirect('/penelitian');
    }
}
