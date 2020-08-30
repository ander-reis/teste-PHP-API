<?php
if (!function_exists('valueFormatted')) {

    function valueFormatted($value)
    {
        $value = str_replace('R$ ', '', $value);
        $value = str_replace(',', '', $value);
        $value = str_replace('.', '', $value);
        return $value;
    }
}
