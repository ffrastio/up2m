<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class AuthorRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        // Cek apakah CREATE atau UPDATE
        if ($this->method() == 'PATCH') {
            $nidn    = 'required|string|unique:author,nidn,' . $this->get('id');
        } else {
            $nidn     = 'required|string|unique:author,nidn|max:10';
        }

        return [
            'nidn'       => $nidn,
            'nama'      => 'required|string|max:50',
            'avatar' => 'sometimes|nullable|image|mimes:png,jpg,jpeg|
                        max:500|dimensions:min_width=100,max_height:200',
            'id_jurusan' => 'required',
            'id_prodi' => 'required'
        ];
    }

    public function messages()
    {
        return [
            'nidn.required'      => 'Nomor Induk Dosen wajib diisi.',
            'nidn.unique'       => 'NIDN sudah terpakai',
            'nidn.max'           => 'NIDN maksimal diisi dengan 10 karakter.',
            'nama.required'      => 'Nama wajib diisi.',
            'nama.max'           => 'Nama maksimal diisi dengan 50 karakter.',
            'avatar.mimes'         => 'Hanya file dengan tipe .png .jpg dan .jpeg',
            'avatar.max'           => 'Ukuran file maksimal 500kb',
            'id_jurusan.required'      => 'Jurusan wajib diisi.',
            'id_prodi.required'      => 'Prodi wajib diisi.',
        ];
    }
}
