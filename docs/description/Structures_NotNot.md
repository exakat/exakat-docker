This is a wrongly done type casting to boolean : 

<?php
    // Wrong type casting
    $b = !!$x; 

    // Explicit code
    $b = (boolean) $x; 
?>
