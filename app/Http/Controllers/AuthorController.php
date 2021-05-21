<?php

namespace App\Http\Controllers;

use App\Http\Requests\AuthorRequest;
use App\Models\Author;
use Illuminate\Support\Facades\Storage;
use Illuminate\Http\Request;

class AuthorController extends Controller
{
    public function index()
    {
        $items = Author::all();
        return view('pages.author.index', [
            'items' => $items,
        ]);
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
            $request->file('avatar')->move('fotoupload', $foto_name);
            return $foto_name;
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
                $delete = Storage::disk('foto')->delete($author->avatar);
            }
            //Upload foto baru
            $foto = $request->file('avatar');
            $ext = $foto->getClientOriginalExtension();
            if ($request->file('avatar')->isValid()) {
                $foto_name = "author-" . date('YmdHis') . ".$ext";
                $upload_path = 'fotoupload';
                $request->file('avatar')->move($upload_path, $foto_name);
                return $foto_name;
            }
        }
    }

    public function destroy(Author $author)
    {
        //Hapus foto kalo ada
        $this->hapusFoto($author);

        $author->delete();
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
