<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller as Controller;
use App\Models\Author;
use App\Models\Jurusan;
use App\Models\Penelitian;
use App\Models\Pengabdian;

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
        $penelitian = Penelitian::where('tahun', $request->tahun)->get();
        $total = $penelitian->count();
        $dikti = Penelitian::where(['tahun' => $request->tahun, 'kategori' => 'DIKTI'])
            ->get()->count();
        $internal = Penelitian::where(['tahun' => $request->tahun, 'kategori' => 'Internal'])
            ->get()->count();
        $tm = Penelitian::where(['tahun' => $request->tahun, 'jurusan' => 'teknik mesin'])
            ->get()->count();
        $ts = Penelitian::where(['tahun' => $request->tahun, 'jurusan' => 'teknik sipil'])
            ->get()->count();
        $te = Penelitian::where(['tahun' => $request->tahun, 'jurusan' => 'teknik elektro'])
            ->get()->count();
        $tik = Penelitian::where(['tahun' => $request->tahun, 'jurusan' => 'teknik informatika dan komputer'])
            ->get()->count();
        $tgp = Penelitian::where(['tahun' => $request->tahun, 'jurusan' => 'teknik grafika dan penerbitan'])
            ->get()->count();
        $ak = Penelitian::where(['tahun' => $request->tahun, 'jurusan' => 'akuntansi'])
            ->get()->count();
        $an = Penelitian::where(['tahun' => $request->tahun, 'jurusan' => 'administrasi niaga'])
            ->get()->count();
        $p3m = Penelitian::where(['tahun' => $request->tahun, 'jurusan' => 'p3m'])
            ->get()->count();

        return response()->json([
            'success' => true,
            'message' => 'Penelitian tahun ' . $request->tahun . ' retrieved successfully.',
            'total_data' => $total,
            'total_dikti' => $dikti,
            'total_internal' => $internal,
            'total_tm' => $tm,
            'total_ts' => $ts,
            'total_te' => $te,
            'total_tik' => $tik,
            'total_tgp' => $tgp,
            'total_ak' => $ak,
            'total_an' => $an,
            'total_p3m' => $p3m,
            // 'data'    => $penelitian,
        ], 200);
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
        $pengabdian = Pengabdian::where('tahun', $request->tahun)->get();
        $total = $pengabdian->count();
        $dikti = Pengabdian::where(['tahun' => $request->tahun, 'kategori' => 'DIKTI'])
            ->get()->count();
        $internal = Pengabdian::where(['tahun' => $request->tahun, 'kategori' => 'Internal'])
            ->get()->count();
        $tm = Pengabdian::where(['tahun' => $request->tahun, 'jurusan' => 'teknik mesin'])
            ->get()->count();
        $ts = Pengabdian::where(['tahun' => $request->tahun, 'jurusan' => 'teknik sipil'])
            ->get()->count();
        $te = Pengabdian::where(['tahun' => $request->tahun, 'jurusan' => 'teknik elektro'])
            ->get()->count();
        $tik = Pengabdian::where(['tahun' => $request->tahun, 'jurusan' => 'teknik informatika dan komputer'])
            ->get()->count();
        $tgp = Pengabdian::where(['tahun' => $request->tahun, 'jurusan' => 'teknik grafika dan penerbitan'])
            ->get()->count();
        $ak = Pengabdian::where(['tahun' => $request->tahun, 'jurusan' => 'akuntansi'])
            ->get()->count();
        $an = Pengabdian::where(['tahun' => $request->tahun, 'jurusan' => 'administrasi niaga'])
            ->get()->count();
        $p3m = Pengabdian::where(['tahun' => $request->tahun, 'jurusan' => 'p3m'])
            ->get()->count();

        return response()->json([
            'success' => true,
            'message' => 'Pengabdian tahun ' . $request->tahun . ' retrieved successfully.',
            'total_data' => $total,
            'total_dikti' => $dikti,
            'total_internal' => $internal,
            'total_tm' => $tm,
            'total_ts' => $ts,
            'total_te' => $te,
            'total_tik' => $tik,
            'total_tgp' => $tgp,
            'total_ak' => $ak,
            'total_an' => $an,
            'total_p3m' => $p3m,
            // 'data'    => $pengabdian,
        ], 200);
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
