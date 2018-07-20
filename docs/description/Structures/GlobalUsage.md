List usage of globals variables, with global keywords or direct access to $GLOBALS.

<?php
$a = 1; /* global scope */ 

function test()
{ 
    echo $a; /* reference to local scope variable */ 
} 

test();

?>
It is recommended to avoid using global variables, at it makes it very difficult to track changes in values across the whole application. 

See also [Variable scope](http://php.net/manual/en/language.variables.scope.php).
