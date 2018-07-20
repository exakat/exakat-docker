The result of that function may be mistaken with an error.

strpos(), along with several PHP native functions, returns a string position, starting at 0, or false, in case of failure. 

<?php

// This is the best comparison
if (strpos($string, 'a') === false) { }

// This is OK, as 2 won't be mistaken with false
if (strpos($string, 'a') == 2) { }

// strpos is one of the 26 functions that may behave this way
if (preg_match($regex, $string)) { } 

// This works like above, catching the value for later reuse
if ($a = strpos($string, 'a')) { }

// This misses the case where 'a' is the first char of the string
if (strpos($string, 'a')) { }

// This misses the case where 'a' is the first char of the string, just like above
if (strpos($string, 'a') == 0) { }

?>

It is recommended to check the result of strpos() with === or !==, so as to avoid confusing 0 and false. 

This analyzer list all the strpos()-like functions that are directly compared with == or !=. preg_match(), when its first argument is a literal, is omitted : this function only returns NULL in case of regex error. 

