Use short assignment operator, to speed up code, and keep syntax clear.  

Some operators, like * or +, have a compact and fast 'do-and-assign' version. They looks like a compacted version for = and the operator. This syntax is good for readability, and saves some memory in the process. 

Depending on the operator, not all permutations of arguments are possible. 

Addition and short assignation of addition have a different set of features when applied to arrays. Do not exchange one another in that case.

<?php

$a = 10 + $a;
$a += 10;

$b = $b - 1;
$b -= 1;

$c = $c * 2;
$c *= 2;

$d = $d / 3;
$d /= 3;

$e = $e % 4;
$e %= 4;

$f = $f | 5;
$f |= 5;

$g = $g & 6;
$g &= 6;

$h = $h ^ 7;
$h ^= 7;

$i = $i >> 8;
$i >>= 8;

$j = $j << 9;
$j <<= 9;

?>

Short operators are faster than the extended version, though it is a micro-optimization.

See also [Assignation Operators](http://php.net/manual/en/language.operators.assignment.php).

