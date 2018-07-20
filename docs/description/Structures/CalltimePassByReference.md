PHP doesn't allow when a value is turned into a reference at functioncall, since PHP 5.4. 

Either the function use a reference in its signature, either the reference won't pass.

<?php

function foo($name) {
    $arg = ucfirst(strtolower($name));
    echo 'Hello '.$arg;
}

$a = 'name';
foo(&$a);

?>

