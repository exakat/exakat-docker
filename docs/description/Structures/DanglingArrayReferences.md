Always unset a referenced-variable used in a loop.

It is highly recommended to unset blind variables when they are set up as references after a loop. 

<?php

$array = array(1,2,3,4);

foreach($array as &$a) {
    $a += 1;
}
// This only unset the reference, not the value
unset($a);




// Dangling array problem
foreach($array as &$a) {
    $a += 1;
}
//$array === array(3,4,5,6);

// This does nothing (apparently)
// $a is already a reference, even if it doesn't show here.
foreach($array as $a) {}
//$array === array(3,4,5,5);

?>

When omitting this step, the next loop that will also require this variable will deal with garbage values, and produce unexpected results.

See also : [No Dangling Reference](https://github.com/dseguy/clearPHP/blob/master/rules/no-dangling-reference.md), 
           [PHP foreach pass-by-reference: Do it right, or better not at all](https://coderwall.com/p/qx3fpa/php-foreach-pass-by-reference-do-it-right-or-better-not-at-all),
           [How does PHP 'foreach' actually work?](https://stackoverflow.com/questions/10057671/how-does-php-foreach-actually-work/14854568#14854568),
           [References and foreach](https://schlueters.de/blog/archives/141-references-and-foreach.html).
