<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UserRequest extends FormRequest
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
            $nidn    = 'required|string|unique:users,nidn,' . $this->get('id');
        } else {
            $nidn     = 'required|string|unique:users,nidn';
        }

        return [
            'nidn'       => $nidn,
            'nama'      => 'required|string|max:50',
            'email'      => 'required|email',
            'password'      => 'string|min:8|confirmed',
            'profile_photo_path' => 'sometimes|nullable|image|mimes:png,jpg,jpeg|
                        max:500|dimensions:min_width=100,min_height:200',

        ];
    }

    public function messages()
    {
        return [
            'nama.required'      => 'Nama wajib diisi.',
            'nama.max'           => 'Nama maksimal diisi dengan 50 karakter.',
            'email.required'      => 'Email wajib diisi.',
            'password.min' => 'Password minimal 8 karakter',
            'password.confirmed' => 'Password tidak sesuai',
            'profile_photo_path.mimes'         => 'Hanya file dengan tipe .png .jpg dan .jpeg',
            'profile_photo_path.max'           => 'Ukuran file maksimal 500kb'
        ];
    }
}
