Strict comparisons prevent from mistaking an error with a false. 

Booleans may be easily mistaken with other values, especially when the function may return integer or boolean as a normal course of action. 

It is encouraged to use strict comparison === or !== when booleans are involved in a comparison.

<?php

// distinguish between : $b isn't in $a, and, $b is at the beginning of $a 
if (strpos($a, $b) === 0) {
    doSomething();
}

// DOES NOT distinguish between : $b isn't in $a, and, $b is at the beginning of $a 
if (strpos($a, $b)) {
    doSomething();
}

// will NOT mistake 1 and true
$a = array(0, 1, 2, true);
if (in_array($a, true, true)) {
    doSomething();
}

// will mistake 1 and true
$a = array(0, 1, 2, true);
if (in_array($a, true)) {
    doSomething();
}

?>

switch() structures always uses == comparisons. 

Function in_array() has a third parameter to make it use strict comparisons.

