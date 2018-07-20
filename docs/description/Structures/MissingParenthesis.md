Add parenthesis to those expression to prevent bugs. 

<?php

// Missing some parenthesis!!
if (!$a instanceof Stdclass) {
    print Not\n;
} else {
    print Is\n;
}

// Could this addition be actually
$c = -$a + $b;

// This one ? 
$c = -($a + $b);

?>

See also [Operators Precedence](http://php.net/manual/en/language.operators.precedence.php).

