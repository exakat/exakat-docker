Some labels have been defined in the code, but they are not used. They may be removed as they are dead code.

<?php

$a = 0;
A: 

    ++$a;
    
    // A loop. A: is used
    if ($a < 10) { goto A; }

// B is never called explicitely. This is useless.
B: 

?>

There is no analysis for undefined goto call, as PHP checks that goto has a destination label at compile time : 

See also [Goto](http://php.net/manual/en/control-structures.goto.php).

