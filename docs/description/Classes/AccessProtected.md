It is not allowed to access protected properties or methods from outside the class or its relatives.

<?php

class foo {
    protected $bar = 1;
}

$foo = new Foo();
$foo->bar = 2;

?>

