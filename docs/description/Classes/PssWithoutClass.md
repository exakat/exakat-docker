Parent, static and self keywords must be used within a class or a trait. They make no sens outside a class or trait scope, as self and static refers to the current class and parent refers to one of parent above.

PHP 7.0 and later detect their usage at compile time, and emits a fatal error.

<?php

class x {
    const Y = 1;
    
    function foo() {
        // self is \x
        echo self::Y;
    }
}

const Z = 1;
// This doesn't compile anymore
echo self::Z;

?>

Static may be used in a function or a closure, but not globally.