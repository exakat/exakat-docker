Avoid comparing decimal numbers with ==, ===, !==, !=. Real numbers have an error margin which is random, and makes it very difficult to match even if the compared value is a literal. 

PHP uses an internal representation in base 2 : any number difficult to represent with this base (like 0.1 or 0.7) will have a margin of error.

<?php

$a = 1/7;
$b = 2.0;

// 7 * $a is a real, not an integer
var_dump( 7 * $a === 1);

// rounding error leads to wrong comparison
var_dump( (0.1 + 0.7) * 10 == 8);
// although
var_dump( (0.1 + 0.7) * 10);
// displays 8

// precision formula to use with reals. Adapt 0.0001 to your precision needs
var_dump( abs(((0.1 + 0.7) * 10) - 8) < 0.0001); 

?>

Use precision formulas with abs() to approximate values with a given precision, or avoid reals altogether. 

See also [Floating point numbers](http://php.net/manual/en/language.types.float.php#language.types.float).
