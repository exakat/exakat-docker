Logical operators come in two flavors :  and / &&, || / or, ^ / xor. However, they are not exchangeable, as && and and have different precedence. 

<?php

// Avoid lettered operator, as they have lower priority than expected
$a = $b and $c;
// $a === 3

$a = $b && $c;
// $a === 1

?>

It is recommended to use the symbol operators, rather than the letter ones.