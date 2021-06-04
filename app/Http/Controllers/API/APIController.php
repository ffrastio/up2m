<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller as Controller;
use App\Models\Author;
use App\Models\Jurusan;
use App\Models\Penelitian;
use App\Models\Pengabdian;
use Illuminate\Support\Facades\DB;

class APIController extends Controller
{
    /**
     * success response method.
     *
     * @return \Illuminate\Http\Response
     */

    public function getAllPenelitian()
    {
        $penelitian = Penelitian::orderBy('tahun', 'asc')->paginate(20);
        $total = $penelitian->count();

        return $this->sendResponse(
            $penelitian,
            'Penelitian retrieved successfully.',
            $total
        );
    }

    public function getPenelitian($id)
    {
        $penelitian = Penelitian::find($id);

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

    public function getAllPengabdian()
    {
        $pengabdian = Pengabdian::orderBy('tahun', 'asc')->paginate(20);
        $total = $pengabdian->count();

        return $this->sendResponse($pengabdian, 'Pengabdian retrieved successfully.', $total);
    }

    public function getPengabdian($id)
    {
        $pengabdian = Pengabdian::find($id);

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
            ->select(DB::raw('count(skim_penelitian) as skim_count, skim_penelitian'))
            ->where('tahun', $request->tahun)
            ->groupBy('skim_penelitian')
            ->get();

        $total = $skim->count();

        return $this->sendResponse($skim, 'Skim retrieved successfully.', $total);
    }

    public function getSkimPengabdianByTahun(Request $request)
    {
        $skim = DB::table('pengabdian')
            ->select(DB::raw('count(skim_pengabdian) as skim_count, skim_pengabdian'))
            ->where('tahun', $request->tahun)
            ->groupBy('skim_pengabdian')
            ->get();

        $total = $skim->count();

        return $this->sendResponse($skim, 'Skim retrieved successfully.', $total);
    }

    public function getAllJurusan()
    {
        $jurusan = Jurusan::with('prodi')
            ->withCount(['penelitian', 'pengabdian'])->get()->sortBy('nama_jurusan');
        $total = $jurusan->count();

        return $this->sendResponse($jurusan, 'Jurusan retrieved successfully.', $total);
    }

    public function getAllAuthor()
    {
        $author = Author::withCount(['penelitian', 'pengabdian'])->get();
        $total = $author->count();

        return $this->sendResponse($author, 'Author retrieved successfully.', $total);
    }

    public function getAuthor($id)
    {
        $author = Author::with(['penelitian', 'pengabdian'])->get()->find($id);

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
