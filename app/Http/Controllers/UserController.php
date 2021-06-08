<?php

namespace App\Http\Controllers;

use App\Http\Requests\UserRequest;
use App\Models\User;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;

class UserController extends Controller
{
    public function index()
    {
        $items = User::all()->where('isAdmin', '=', 0);
        return view('pages.user.index', [
            'items' => $items,
        ]);
    }

    public function create()
    {
        return view('pages.user.create');
    }

    public function edit($id)
    {
        $user = User::findOrFail($id);
        return view('pages.user.edit', compact('user'));
    }

    public function update(User $user, UserRequest $request)
    {

        $input = $request->all();

        $input['password'] = Hash::make($request->get('password'));
        //Update foto
        if ($request->hasFile('profile_photo_path')) {
            $input['profile_photo_path'] = $this->updateFoto($user, $request);
        }

        $user->update($input);
        Session::flash('sukses', 'Berhasil update data pimpinan');

        return redirect('/user');
    }

    public function store(UserRequest $request)
    {
        User::create([
            'nidn' => $request->nidn,
            'nama' => $request->nama,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'remember_token' => Str::random(60)
        ]);

        return redirect('/user');
    }

    public function uploadFoto(UserRequest $request)
    {
        $foto = $request->file('profile_photo_path');
        $ext = $foto->getClientOriginalExtension();
        if ($request->file('profile_photo_path')->isValid()) {
            $foto_name = "user-" . date('YmdHis') . ".$ext";
            $request->file('profile_photo_path')->move('fotoupload', $foto_name);
            return $foto_name;
        }
        return false;
    }

    public function updateFoto(User $user, UserRequest $request)
    {
        //Jika user mengisi foto
        if ($request->hasFile('profile_photo_path')) {
            //Hapus foto lama jika ada foto baru
            $exist = Storage::disk('foto')->exists($user->profile_photo_path);
            if (isset($user->logo) && $exist) {
                $delete = Storage::disk('foto')->delete($user->profile_photo_path);
            }
            //Upload foto baru
            $foto = $request->file('profile_photo_path');
            $ext = $foto->getClientOriginalExtension();
            if ($request->file('profile_photo_path')->isValid()) {
                $foto_name = "user-" . date('YmdHis') . ".$ext";
                $upload_path = 'fotoupload';
                $request->file('profile_photo_path')->move($upload_path, $foto_name);
                return $foto_name;
            }
        }
    }

    public function hapusFoto(User $user)
    {
        $is_foto_exist = Storage::disk('foto')->exists($user->profile_photo_path);

        if ($is_foto_exist) {
            Storage::disk('foto')->delete('$user->profile_photo_path');
        }
    }

    public function destroy(User $user)
    {
        //Hapus foto kalo ada
        $this->hapusFoto($user);

        $user->delete();
        Session::flash('sukses', 'Berhasil hapus data pimpinan');

        return redirect('/user');
    }
}
