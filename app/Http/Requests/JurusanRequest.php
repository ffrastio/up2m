<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class JurusanRequest extends FormRequest
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
        //cek apakah Create atau Update
        return [
            'nama_jurusan' => 'required|string|max:50',
            'logo' => 'sometimes|nullable|image|mimes:png,jpg,jpeg|
                        max:500|dimensions:min_width=100,max_height:200',
        ];
    }

    public function messages()
    {
        return [
            'nama_jurusan.required'      => 'Judul wajib diisi.',
            'nama_jurusan.max'           => 'Judul maksimal diisi dengan 50 karakter.',
            'logo.mimes'         => 'Hanya file dengan tipe .png .jpg dan .jpeg',
            'logo.max'           => 'Ukuran file maksimal 500kb'
        ];
    }
}
