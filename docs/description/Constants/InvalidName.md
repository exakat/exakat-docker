According to PHP's manual, constant names, ' A valid constant name starts with a letter or underscore, followed by any number of letters, numbers, or underscores.'.

Constant, when defined using define() function, must follow this regex : 

<?literal
/[a-zA-Z_\x7f-\xff][a-zA-Z0-9_\x7f-\xff]*/
?>

<?php

define('+3', 1); // wrong constant! 

echo constant('+3'); // invalid constant access

?>

