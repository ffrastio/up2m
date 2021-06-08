<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class PengabdianRequest extends FormRequest
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
        return [
            'abstrak' => 'nullable|string',
            'besar_dana' => 'nullable|numeric'
        ];
    }

    public function messages()
    {
        return [
            'abstrak.string'      => 'Kolom abstrak harus berisi string.',
            'besar_dana.numeric'           => 'Kolom besar dana harus berisi angka.'
        ];
    }
}
