PHP cannot instantiate an abstract class. 

The classes are actually abstract classes, and should be derived into a concrete class to be instantiated.

<?php

abstract class Foo {
    protected $a;
}

class Bar extends Foo {
    protected $b;
}

// instantiating a concrete class.
new Bar();

// instantiating an abstract class.
// In real life, this is not possible also because the definition and the instantiation are in the same file
new Foo();

?>

See also [Class Abstraction](http://php.net/manual/en/language.oop5.abstract.php).
