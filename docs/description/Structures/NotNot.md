Not Not
Double not makes a boolean, not a true.

This is a wrongly done casting to boolean. PHP supports (boolean) to do the same, faster and cleaner.

<?php
    // Wrong type casting
    $b = !!$x; 

    // Explicit code
    $b = (boolean) $x; 
?>
