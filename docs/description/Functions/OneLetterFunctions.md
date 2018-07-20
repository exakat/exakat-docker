One letter functions seems to be really short for a meaningful name. This may happens for very high usage functions, so as to keep code short, but such functions should be rare.

<?php

// Always use a meaningful name 
function addition($a, $b) {
    return $a + $b;
}

// One letter functions are rarely meaningful
function f($a, $b) {
    return $a + $b;
}

?>

