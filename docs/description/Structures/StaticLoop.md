Static loop may be preprocessed.

It looks like the following loops are static : the same code is executed each time, without taking into account loop variables.

<?php

// Static loop
$total = 0;
for($i = 0; $i < 10; $i++) {
    $total += $i;
}

// The above loop may be replaced by (with some math help)
$total = 10 * (10  + 1) / 2;

// Non-Static loop (the loop depends on the size of the array)
$n = count($array);
for($i = 0; $i < $n; $i++) {
    $total += $i;
}

?>

It is possible to create loops that don't use any blind variables, though this is fairly rare. In particular, calling a method may update an internal pointer, like next() or SimpleXMLIterator::next(). 

It is recommended to turn a static loop into an expression that avoid the loop. For example, replacing the sum of all integers by the function $n * ($n + 1) / 2, or using array_sum().

This analysis doesn't detect usage of variables with `compact`.

 