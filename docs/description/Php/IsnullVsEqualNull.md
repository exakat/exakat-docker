Use === null
It is faster to use === null instead of is_null().

<?php

// Operator === is fast
if ($a === null) {

}

// Function call is slow 
if (is_null($a)) {

}


?>

