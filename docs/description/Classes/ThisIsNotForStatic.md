Static methods shouldn't use $this variable.

$this variable represents an object, the current object. It is not compatible with a static method, which may operate without any object. 

While executing a static method, ``$this`` is actually set to ``NULL``.

<?php

class foo {
    static $staticProperty = 1;

    // Static methods should use static properties
    static public function count() {
        return self::$staticProperty++;
    }
    
    // Static methods can't use $this
    static public function bar() {
        return $this->a;   // No $this usage in a static method
    }
}

?>

See also [Static Keyword](http://php.net/manual/en/language.oop5.static.php).
