<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller as Controller;
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
        $penelitian = Penelitian::all()->sortBy('tahun')->whereNotNull('judul');

        return $this->sendResponse($penelitian, 'Penelitian retrieved succesfully.');
    }

    public function getPenelitian($id)
    {
        $penelitian = Penelitian::find($id);
        if (is_null($penelitian)) {
            return $this->sendError('Penelitian not found.');
        }

        return $this->sendResponse($penelitian, 'Penelitian retrieved succesfully.');
    }

    public function getAllPengabdian()
    {
        $pengabdian = Pengabdian::all()->sortBy('tahun')->whereNotNull('judul');

        return $this->sendResponse($pengabdian, 'Pengabdian retrieved successfully.');
    }

    public function getPengabdian($id)
    {
        $pengabdian = Pengabdian::find($id);
        if (is_null($pengabdian)) {
            return $this->sendError('Pengabdian not found.');
        }

        return $this->sendResponse($pengabdian, 'Pengabdian retrieved successfully.');
    }

    public function sendResponse($result, $message)
    {
        $response = [
            'success' => true,
            'data'    => $result,
            'message' => $message,
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
