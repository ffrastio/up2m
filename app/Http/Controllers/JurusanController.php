<?php

namespace App\Http\Controllers;

use App\Http\Requests\JurusanRequest;
use App\Models\Jurusan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Storage;

class JurusanController extends Controller
{
    public function index()
    {
        $items = Jurusan::all();
        return view('pages.jurusan.index', [
            'items' => $items,
        ]);
    }

    public function create()
    {
        return view('pages.jurusan.create');
    }

    public function edit($id)
    {
        $jurusan = Jurusan::findOrFail($id);
        return view('pages.jurusan.edit', compact('jurusan'));
    }

    public function update(Jurusan $jurusan, JurusanRequest $request)
    {
        $input = $request->all();

        //Update foto
        if ($request->hasFile('logo')) {
            $input['logo'] = $this->updateFoto($jurusan, $request);
        }

        //update data jurusan
        $jurusan->update($input);
        Session::flash('sukses', 'Berhasil update data jurusan');

        return redirect('/jurusan');
    }

    public function show($id)
    {
        $jurusan = Jurusan::with('prodi')->findOrFail($id);

        return view('pages.jurusan.show', compact('jurusan'));
    }

    public function store(JurusanRequest $request)
    {
        $input = $request->all();

        //Upload Foto
        if ($request->hasFile('logo')) {
            $input['logo'] = $this->uploadFoto($request);
        }

        //Simpan data jurusan
        Jurusan::create($input);
        Session::flash('sukses', 'Berhasil tambah data jurusan');

        return redirect('/jurusan');
    }

    private function uploadFoto(JurusanRequest $request)
    {
        $foto = $request->file('logo');
        $ext = $foto->getClientOriginalExtension();
        if ($request->file('logo')->isValid()) {
            $foto_name = "jurusan-" . date('YmdHis') . ".$ext";
            $upload_path = $request->file('logo')->storeAs('public/fotoupload', $foto_name);

            return $upload_path;
        }
        return false;
    }

    private function updateFoto(Jurusan $jurusan, JurusanRequest $request)
    {
        //Jika user mengisi foto
        if ($request->hasFile('logo')) {
            //Hapus foto lama jika ada foto baru
            $exist = Storage::disk('foto')->exists($jurusan->logo);
            if (isset($jurusan->logo) && $exist) {
                Storage::disk('foto')->delete($jurusan->logo);
            }
            //Upload foto baru
            $foto = $request->file('logo');
            $ext = $foto->getClientOriginalExtension();
            if ($request->file('logo')->isValid()) {
                $foto_name = "jurusan-" . date('YmdHis') . ".$ext";
                $upload_path = $request->file('logo')->storeAs('public/fotoupload', $foto_name);

                return $upload_path;
            }
        }
    }

    public function destroy(Jurusan $jurusan)
    {
        //Hapus foto kalo ada
        $this->hapusFoto($jurusan);

        $jurusan->delete();
        Session::flash('sukses', 'Berhasil hapus data jurusan');

        return redirect('/jurusan');
    }

    private function hapusFoto(Jurusan $jurusan)
    {
        $is_foto_exist = Storage::disk('foto')->exists($jurusan->logo);

        if ($is_foto_exist) {
            Storage::disk('foto')->delete('$jurusan->logo');
        }
    }
}
