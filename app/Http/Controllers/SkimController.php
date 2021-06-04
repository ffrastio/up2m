<?php

namespace App\Http\Controllers;

use App\Models\Skim;
use Illuminate\Http\Request;

class SkimController extends Controller
{
    public function index()
    {
        $items = Skim::all()->sortBy('skim');
        return view('pages.skim.index', [
            'items' => $items,
        ]);
    }
}
