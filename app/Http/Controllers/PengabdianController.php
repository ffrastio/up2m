<?php

namespace App\Http\Controllers;

use App\Http\Requests\ImportRequest;
use App\Http\Requests\PengabdianRequest;
use App\Imports\PengabdianImport;
use App\Models\Pengabdian;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
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

    public function create()
    {
        $skim = DB::table('skim')->where('jenis', '=', 'Pengabdian')
            ->orderBy('skim', 'asc')
            ->select(DB::raw('skim, id'));
        $jurusan = DB::table('jurusan')->orderBy('nama_jurusan', 'asc')
            ->select(DB::raw('nama_jurusan, id'));
        $list_skim = $skim->pluck('skim', 'skim')->toArray();
        $list_jurusan = $jurusan->pluck('nama_jurusan', 'nama_jurusan')->toArray();

        return view('pages.pengabdian.create', compact('list_skim', 'list_jurusan'));
    }

    function fetch(Request $request)
    {
        if ($request->get('query')) {
            $query = $request->get('query');
            $data = DB::table('author')
                ->where('nama', 'LIKE', "%{$query}%")
                ->get();
            $output = '<ul class="list-group" style="display:block; position:relative">';
            foreach ($data as $row) {
                $output .= '
       <li class="list-group-item"><a href="#">' . $row->nama . '</a></li>
       ';
            }
            $output .= '</ul>';
            echo $output;
        }
    }

    public function show($id)
    {
        $pengabdian = Pengabdian::findOrFail($id);

        return view('pages.pengabdian.show', compact('pengabdian'));
    }

    public function store(PengabdianRequest $request)
    {
        //$input = $request->all();

        //Upload File
        // if ($request->hasFile('logo')) {
        //     $input['logo'] = $this->uploadFoto($request);
        // }

        //Simpan data jurusan
        Pengabdian::create([
            'skim_pengabdian' => $request->skim_pengabdian,
            'nama_ketua_pengabdian' => $request->nama_ketua_pengabdian,
            'jurusan' => $request->jurusan,
            'judul' => $request->judul,
            'abstrak' => $request->abstrak,
            'besar_dana' => $request->besar_dana,
            'tahun' => $request->tahun,
            'kategori' => $request->kategori,
            'nama_anggota' => $request->nama_anggota,
            'nama_author' => $request->nama_ketua_pengabdian,
        ]);
        Session::flash('sukses', 'Berhasil tambah data pengabdian');

        return redirect('/pengabdian');
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
