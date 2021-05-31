<?php

namespace App\Http\Controllers;

use App\Http\Requests\JurusanRequest;
use App\Models\Jurusan;
use Illuminate\Http\Request;
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

        return redirect('/jurusan');
    }

    private function uploadFoto(JurusanRequest $request)
    {
        $foto = $request->file('logo');
        $ext = $foto->getClientOriginalExtension();
        if ($request->file('logo')->isValid()) {
            $foto_name = "jurusan-" . date('YmdHis') . ".$ext";
            $request->file('logo')->move('fotoupload', $foto_name);
            return $foto_name;
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
                $delete = Storage::disk('foto')->delete($jurusan->logo);
            }
            //Upload foto baru
            $foto = $request->file('logo');
            $ext = $foto->getClientOriginalExtension();
            if ($request->file('logo')->isValid()) {
                $foto_name = "jurusan-" . date('YmdHis') . ".$ext";
                $upload_path = 'fotoupload';
                $request->file('logo')->move($upload_path, $foto_name);
                return $foto_name;
            }
        }
    }

    public function destroy(Jurusan $jurusan)
    {
        //Hapus foto kalo ada
        $this->hapusFoto($jurusan);

        $jurusan->delete();
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
