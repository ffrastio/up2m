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
            'name'      => 'required|string',
            'email'      => 'required|email',
            'password'      => 'required|string|min:8|confirmed',
            'role' => 'required'

        ];
    }
}
