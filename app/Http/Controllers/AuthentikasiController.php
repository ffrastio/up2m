<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AuthentikasiController extends Controller
{
    public function index()
    {
        return view('auth.login');
    }
    public function proses_login(Request $request)
    {
        request()->validate([
            'identity' => 'required',
            'password' => 'required',
        ]);

        if (is_numeric($request->get('identity'))) {
            $credentials = ['nidn' => $request->get('identity'), 'password' => $request->get('password')];
        } elseif (filter_var($request->get('identity'), FILTER_VALIDATE_EMAIL)) {
            $credentials = ['email' => $request->get('identity'), 'password' => $request->get('password')];
        }
        if (Auth::attempt($credentials)) {
            $user = Auth::user();
            if ($user->isAdmin == 1) {
                return redirect()->intended('dashboard');
            }
            return redirect('/')->withErrors('These credentials do not match our records!');
        }
        return redirect('/')->withErrors('These credentials do not match our records!');
    }
    public function logout(Request $request)
    {
        $request->session()->flush();
        Auth::logout();
        return Redirect('/');
    }
}
