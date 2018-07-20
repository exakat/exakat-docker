Adding 0 is useless, as 0 is the neutral element for addition. In PHP, it triggers a cast to integer. 

It is recommended to make the cast explicit with (int) 

<?php

// Explicit cast
$a = (int) foo();

// Useless addition
$a = foo() + 0;
$a = 0 + foo();

// Also works with minus
$b = 0 - $c; // drop the 0, but keep the minus
$b = $c - 0; // drop the 0 and the minus

$a += 0;
$a -= 0;

?>

If it is used to type cast a value to integer, then casting (integer) is clearer. 
