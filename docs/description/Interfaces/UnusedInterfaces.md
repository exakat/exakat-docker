Some interfaces are defined but not used. 

They should be removed, as they are probably dead code.

<?php

interface used {}
interface unused {}

// Used by implementation
class c implements used {}

// Used by extension
interface j implements used {}

$x = new c;

// Used in a instanceof
var_dump($x instanceof used); 

// Used in a typehint
function foo(Used $x) {}

?>

