Static methods are also called ``class methods`` : they may be called even if the class has no instantiated object. Thus, the local variable ``$this`` won't exist, PHP will set it to NULL as usual. 

<?php

class foo {
    // Static method may access other static methods, or property, or none. 
    static function staticBar() {
        // This is not possible in a static method
        return self::otherStaticBar() . static::$staticProperty;
    }

    static function bar() {
        // This is not possible in a static method
        return $this->property;
    }

}

?>

Either, this is not a static method (simply remove the ``static`` keyword), or replace all $this mention by static properties ``Class::$property``.

See also [Static Keyword](http://php.net/manual/en/language.oop5.static.php)
