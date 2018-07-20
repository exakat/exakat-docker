The instanceof operator is a more precise alternative to is_object(). It is also faster.

instanceof checks for an variable to be of a class or its parents or the interfaces it implements. 
Once instanceof has been used, the actual attributes available (properties, constants, methods) are known, unlike with is_object().

Last, instanceof may be upgraded to Typehint, by moving it to the method signature. 

<?php

class Foo {

    // Don't use is_object
    public function bar($o) {
        if (!is_object($o)) { return false; } // Classic argument check
        return $o->method();
    }

    // use instanceof
    public function bar($o) {
        if ($o instanceof myClass) {  // Now, we know which methods are available
            return $o->method();
        }
        
        return false; } // Default behavior
    }

    // use of typehinting
    // in case $o is not of the right type, exception is raised automatically
    public function bar(myClass $o) {
        return $o->method();
    }
}

?>

instanceof and is_object() may not be always interchangeable. Consider using isset on a known property for a simple check on object. You may also consider is_string(), is_integer() or is_scalar(), in particular instead of !is_object().

The instanceof operator is also faster than the is_object() functioncall. 

See also [Type Operators](http://php.net/manual/en/language.operators.type.php#language.operators.type) and 
         [is_object](http://php.net/manual/en/function.is-object.php).
