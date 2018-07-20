``$this`` variable represents the current object and it is not an array, unless the class (or its parents) has the ArrayAccess interface.

<?php

// $this is an array
class Foo extends ArrayAccess {
    function bar() {
        ++$this[3];
    }
}

// $this is not an array
class Foo2 {
    function bar() {
        ++$this[3];
    }
}

?>

See also [ArrayAccess](http://php.net/manual/en/class.arrayaccess.php) and 
         [The Basics](http://php.net/manual/en/language.oop5.basic.php).
