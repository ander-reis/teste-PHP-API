<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ProductRequest extends FormRequest
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
        $this->sanitize();

        return [
            'name' => 'required|string|max:255|min:3',
            'value' => 'required'
        ];
    }

    /**
     *  sanitize
     */
    public function sanitize()
    {
        $input = $this->all();
        $input['name'] = trim(filter_var($input['name'], FILTER_SANITIZE_STRING));
        $input['value'] = valueFormatted($input['value']);
        $this->replace($input);
    }
}
