<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller as Controller;
use App\Models\Author;
use App\Models\Jurusan;
use App\Models\Penelitian;
use App\Models\Pengabdian;
use App\Models\Skim;
use Illuminate\Support\Facades\DB;

class APIController extends Controller
{
    /**
     * success response method.
     *
     * @return \Illuminate\Http\Response
     */

    public function getAllPenelitian(Request $request)
    {
        $limit = $request->input('limit', 20);
        $penelitian = Penelitian::orderBy('tahun', 'asc')->paginate($limit);
        $total = $penelitian->count();

        return $this->sendResponse(
            $penelitian,
            'Penelitian retrieved successfully.',
            $total
        );
    }

    public function getPenelitian(Request $request)
    {
        $penelitian = Penelitian::where('id', $request->id)->get();;

        if (is_null($penelitian)) {
            return $this->sendError('Penelitian not found.');
        }

        return $this->sendResponse($penelitian, 'Penelitian retrieved successfully.', '');
    }

    public function getPenelitianByTahun(Request $request)
    {
        $penelitian = DB::table('penelitian')
            ->select(DB::raw('jurusan, count(jurusan) as penelitian_count'))
            ->where('tahun', $request->tahun)
            ->groupBy('jurusan')
            ->get();
        $total = $penelitian->count();

        return $this->sendResponse($penelitian, 'Penelitian retrieved successfully.', $total);
    }

    public function getAllPengabdian(Request $request)
    {
        $limit = $request->input('limit', 20);
        $pengabdian = Pengabdian::orderBy('tahun', 'asc')->paginate($limit);
        $total = $pengabdian->count();

        return $this->sendResponse($pengabdian, 'Pengabdian retrieved successfully.', $total);
    }

    public function getPengabdian(Request $request)
    {
        $pengabdian = Pengabdian::where('id', $request->id)->get();

        if (is_null($pengabdian)) {
            return $this->sendError('Pengabdian not found.');
        }

        return $this->sendResponse($pengabdian, 'Pengabdian retrieved successfully.', '');
    }

    public function getPengabdianByTahun(Request $request)
    {
        $pengabdian = DB::table('pengabdian')
            ->select(DB::raw('jurusan, count(jurusan) as pengabdian_count'))
            ->where('tahun', $request->tahun)
            ->groupBy('jurusan')
            ->get();
        $total = $pengabdian->count();

        return $this->sendResponse($pengabdian, 'Pengabdian retrieved successfully.', $total);
    }

    public function getSkimPenelitianByTahun(Request $request)
    {
        $skim = DB::table('penelitian')
            ->select(DB::raw('skim_penelitian, count(skim_penelitian) as penelitian_count'))
            ->where('tahun', $request->tahun)
            ->groupBy('skim_penelitian')
            ->get();

        $total = $skim->count();

        return $this->sendResponse($skim, 'Skim retrieved successfully.', $total);
    }

    public function getSkimPengabdianByTahun(Request $request)
    {
        $skim = DB::table('pengabdian')
            ->select(DB::raw('skim_pengabdian, count(skim_pengabdian) as pengabdian_count '))
            ->where('tahun', $request->tahun)
            ->groupBy('skim_pengabdian')
            ->get();

        $total = $skim->count();

        return $this->sendResponse($skim, 'Skim retrieved successfully.', $total);
    }

    public function getAllJurusan()
    {
        $jurusan = Jurusan::orderBy('nama_jurusan')->with('prodi')
            ->withCount(['penelitian', 'pengabdian'])->get();
        $jurusan->values()->all();
        $total = $jurusan->count();

        return $this->sendResponse($jurusan, 'Jurusan retrieved successfully.', $total);
    }

    public function getAllAuthor()
    {
        $author = Author::orderBy('nama')->withCount(['penelitian', 'pengabdian'])->get();
        $author->values()->all();
        $total = $author->count();

        return $this->sendResponse($author, 'Author retrieved successfully.', $total);
    }

    public function getAuthor(Request $request)
    {
        $author = Author::with(['penelitian', 'pengabdian'])
            ->where('id', $request->id)->get();

        if (is_null($author)) {
            return $this->sendError('Author not found.');
        }

        return $this->sendResponse($author, 'Author retrieved successfully.', '');
    }

    public function sendResponse($result, $message, $total)
    {
        $response = [
            'success' => true,
            'message' => $message,
            'total_data' => $total,
            'data'    => $result,
        ];
        return response()->json($response, 200);
    }


    /*
     * return error response.
     *
     * @return \Illuminate\Http\Response
     */
    public function sendError($error, $errorMessages = [], $code = 404)
    {
        $response = [
            'success' => false,
            'message' => $error,
        ];

        if (!empty($errorMessages)) {
            $response['data'] = $errorMessages;
        }

        return response()->json($response, $code);
    }
}
