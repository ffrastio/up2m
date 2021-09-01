<?php

namespace App\Http\Controllers;

use App\Http\Requests\ImportRequest;
use App\Http\Requests\PenelitianRequest;
use App\Imports\PenelitianImport;
use App\Models\Penelitian;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
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

    public function create()
    {
        $skim = DB::table('skim')->where('jenis', '=', 'Penelitian')
            ->orderBy('skim', 'asc')
            ->select(DB::raw('skim, id'));
        $jurusan = DB::table('jurusan')->orderBy('nama_jurusan', 'asc')
            ->select(DB::raw('nama_jurusan, id'));
        $list_skim = $skim->pluck('skim', 'skim')->toArray();
        $list_jurusan = $jurusan->pluck('nama_jurusan', 'nama_jurusan')->toArray();

        return view('pages.penelitian.create', compact('list_skim', 'list_jurusan'));
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
        $penelitian = Penelitian::findOrFail($id);

        return view('pages.penelitian.show', compact('penelitian'));
    }

    public function store(PenelitianRequest $request)
    {
        //$input = $request->all();

        //Upload File
        // if ($request->hasFile('logo')) {
        //     $input['logo'] = $this->uploadFoto($request);
        // }

        //Simpan data jurusan
        Penelitian::create([
            'skim_penelitian' => $request->skim_penelitian,
            'nama_ketua_penelitian' => $request->nama_ketua_penelitian,
            'jurusan' => $request->jurusan,
            'judul' => $request->judul,
            'abstrak' => $request->abstrak,
            'besar_dana' => $request->besar_dana,
            'tahun' => $request->tahun,
            'kategori' => $request->kategori,
            'nama_anggota' => $request->nama_anggota,
            'nama_author' => $request->nama_ketua_penelitian,
        ]);
        Session::flash('sukses', 'Berhasil tambah data penelitian');

        return redirect('/penelitian');
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
        try {
            // menangkap file excel
            $file = $request->file('file');
            $tahun = $request->tahun;

            // membuat nama file
            $nama_file = $file->getClientOriginalName();

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
        } catch (\Maatwebsite\Excel\Validators\ValidationException $e) {
            $e->errors();
            // foreach ($failures->failures() as $failure) {
            //     $failure->row(); // row that went wrong
            //     $failure->attribute(); // either heading key (if using heading row concern) or column index
            //     $failure->errors(); // Actual error messages from Laravel validator
            //     $failure->values(); // The values of the row that has failed.
            // }
            Session::flash('gagal', 'Data Penelitian Tahun ' . $tahun . ' Gagal import!');
            return redirect('/penelitian');
        }
    }
}
