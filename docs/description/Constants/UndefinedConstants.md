Constants definition can't be located.

Those constants are not defined in the code, and will raise errors, or use the fallback mechanism of being treated like a string. 

<?php

const A = 1;
define('B', 2);

// here, C is not defined in the code and is reported
echo A.B.C;

?>

It is recommended to define them all, or to avoid using them.

See also [Constants](http://php.net/manual/en/language.constants.php).

