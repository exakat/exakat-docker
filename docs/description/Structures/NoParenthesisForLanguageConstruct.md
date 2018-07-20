Some PHP language constructs, such are ``include``, ``print``, ``echo`` don't need parenthesis. They cope with parenthesis, but it is may lead to strange situations. 

<?php

// This is an attempt to load 'foo.inc', or kill the script
include('foo.inc') or die();
// in fact, this is read by PHP as : include 1 
// include  'foo.inc' or die();

?>

It it better to avoid using parenthesis with ``echo``, ``print``, ``return``, ``throw``, ``yield``, ``yield from``, ``include``, ``require``, ``include_once``, ``require_once``.

See also [include](http://php.net/manual/en/function.include.php).
