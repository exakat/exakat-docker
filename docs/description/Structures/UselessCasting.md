There is no need to overcast returned values.

<?php

// trim always returns a string : cast is useless
$a = (string) trim($b);

// strpos doesn't always returns an integer : cast is useful
$a = (boolean) strpos($b, $c);

// comparison don't need casting, nor parenthesis
$c = (bool) ($b > 2);

?>

See also [Type juggling](http://php.net/manual/en/language.types.type-juggling.php).
