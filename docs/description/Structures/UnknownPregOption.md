Regex support in PHP accepts the following list of options : ``eimsuxADJSUX``. 

All other letter used as option are not supported : depending on the situation, they may be ignored or raise an error.

<?php

// all options are available
if (preg_match('/\d+/isA', $string, $results)) { }

// p and h are not regex options, p is double
if (preg_match('/\d+/php', $string, $results)) { }

?>

See also [Pattern Modifiers](http://php.net/manual/en/reference.pcre.pattern.modifiers.php)
