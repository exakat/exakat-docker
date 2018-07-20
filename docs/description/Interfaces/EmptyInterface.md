Empty interfaces are a code smell. Interfaces should contains at least a method or a constant, and not be totally empty.

<?php

// an empty interface
interface empty {}

// an normal interface
interface normal {
    public function i() ;
}

// a constants interface
interface constantsOnly {
    const FOO = 1;
}

?>

See also [Empty interfaces are bad practice](https://r.je/empty-interfaces-bad-practice.html) and [Blog : Are empty interfaces code smell?](https://hackernoon.com/are-interfaces-code-smell-bd19abc266d3).

