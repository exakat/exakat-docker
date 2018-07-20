Indices in an array notation such as `$array['indice']` may only be integers or string.

Boolean, Null or float will be converted to their integer or string equivalent.

<?php
    $a = [true => 1,
          1.0  => 2,
          1.2  => 3,
          1    => 4,
          '1'  => 5,
          0.8  => 6,
          0x1  => 7,
          01   => 8,
          
          null  => 1,
          ''    => 2,
          
          false => 1,
          0     => 2,

          '0.8' => 3,
          '01'  => 4,
          '2a'  => 5
          ];
          
    print_r($a);
?>

<?literal
Array
(
    [1] => 8
    [0] => 2
    [] => 2
    [0.8] => 3
    [01] => 4
    [2a] => 5
)
?>

Decimal numbers are rounded to the closest integer; Null is transtyped to '' (empty string); true is 1 and false is 0; Integers in strings are transtyped, while partial numbers or decimals are not analyzed in strings. 

As a general rule of thumb, only use integers or strings that don\'t look like integers. 

This analyzer may find constant definitions, when available.

