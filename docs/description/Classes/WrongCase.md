The spotted classes are used with a different case than their definition. While PHP accepts this, it makes the code harder to read. 

It may also be a violation of coding conventions.

<?php

// This use statement has wrong case for origin.
use Foo as X;

// Definition of the class
class foo {}

// Those instantiations have wrong case
new FOO();
new X();

?>

See also [PHP class name constant case sensitivity and PSR-11](https://gist.github.com/bcremer/9e8d6903ae38a25784fb1985967c6056).
