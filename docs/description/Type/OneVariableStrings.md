These strings only contains one variable or property or array. 

<?php

$a = 0;
$b = "$a"; // This is a one-variable string

// Better way to write the above
$b = (string) $a;

// Alternatives : 
$b2 = "$a[1]"; // This is a one-variable string
$b3 = "$a->b"; // This is a one-variable string
$c = "d";
$d = "D";
$b4 = "{$$c}";
$b5 = "{$a->foo()}";

?>

When the goal is to convert a variable to a string, it is recommended to use the type casting (string) operator : it is then clearer to understand the conversion. It is also marginally faster, though very little. 

See also [Strings](http://php.net/manual/en/language.types.string.php) and
         [Type Juggling](http://php.net/manual/en/language.types.type-juggling.php).
