<?php

namespace App\Http\Controllers;

use App\Http\Requests\AuthorRequest;
use App\Models\Author;
use Illuminate\Support\Facades\Storage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class AuthorController extends Controller
{
    public function index()
    {
        $items = Author::all()->sortBy('nama');
        return view('pages.author.index', compact('items'));
    }

    public function create()
    {
        return view('pages.author.create');
    }

    public function edit($id)
    {
        $author = Author::findOrFail($id);
        return view('pages.author.edit', compact('author'));
    }

    public function update(Author $author, AuthorRequest $request)
    {
        $input = $request->all();

        //Update foto
        if ($request->hasFile('avatar')) {
            $input['avatar'] = $this->updateFoto($author, $request);
        }

        //update data author
        $author->update($input);
        Session::flash('sukses', 'Berhasil update data author');

        return redirect('/author');
    }

    public function store(AuthorRequest $request)
    {
        $input = $request->all();

        //Upload foto
        if ($request->hasFile('avatar')) {
            $input['avatar'] = $this->uploadFoto($request);
        }

        //Simpan data author
        Author::create($input);
        return redirect('/author');
    }

    private function uploadFoto(AuthorRequest $request)
    {
        $foto = $request->file('avatar');
        $ext = $foto->getClientOriginalExtension();
        if ($request->file('avatar')->isValid()) {
            $foto_name = "author-" . date('YmdHis') . ".$ext";
            $upload_path = $request->file('avatar')->storeAs('public/fotoupload', $foto_name);

            return $upload_path;
        }
        return false;
    }

    private function updateFoto(Author $author, AuthorRequest $request)
    {
        //Jika user mengisi foto
        if ($request->hasFile('avatar')) {
            //Hapus foto lama jika ada foto baru
            $exist = Storage::disk('foto')->exists($author->avatar);
            if (isset($author->avatar) && $exist) {
                Storage::disk('foto')->delete($author->avatar);
            }
            //Upload foto baru
            $foto = $request->file('avatar');
            $ext = $foto->getClientOriginalExtension();
            if ($request->file('avatar')->isValid()) {
                $foto_name = "author-" . date('YmdHis') . ".$ext";
                $upload_path = $request->file('avatar')->storeAs('public/fotoupload', $foto_name);

                return $upload_path;
            }
        }
    }

    public function destroy(Author $author)
    {
        //Hapus foto kalo ada
        $this->hapusFoto($author);

        $author->delete();
        Session::flash('sukses', 'Berhasil hapus data author');

        return redirect('/author');
    }

    private function hapusFoto(Author $author)
    {
        $is_foto_exist = Storage::disk('foto')->exists($author->avatar);

        if ($is_foto_exist) {
            Storage::disk('foto')->delete('$author->avatar');
        }
    }
}
