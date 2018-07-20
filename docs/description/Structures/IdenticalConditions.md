These logical expressions contain members that are identical. 

This means those expressions may be simplified. 

<?php

// twice $a
if ($a || $b || $c || $a) {  }

// Hiding in parenthesis is bad
if (($a) ^ ($a)) {}

// expressions may be large
if ($a === 1 && 1 === $a) {}

?>