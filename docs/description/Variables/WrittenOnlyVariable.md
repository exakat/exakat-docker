Those variables are being written, but never read. This way, they are useless and should be removed, or read at some point.

<?php

// $a is used multiple times, but never read
$a = 'a';
$a .= 'b';

$b = 3; 
//$b is actually read once
$a .= $b + 3; 

?>
