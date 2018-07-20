PHP classes used to have the method bearing the same name as the class acts as the constructor. That was PHP 4, and early PHP 5. 

The manual issues a warning about this syntax : 'Old style constructors are DEPRECATED in PHP 7.0, and will be removed in a future version. You should always use __construct() in new code.'

<?php

namespace {
    // Global namespace is important
    class foo {
        function foo() {
            // This acts as the old-style constructor, and is reported by PHP
        }
    }

    class bar {
        function __construct() { }
        function bar() {
            // This doesn't act as constructor, as bar has a __construct() method
        }
    }
}

namespace Foo\Bar{
    class foo {
        function foo() {
            // This doesn't act as constructor, as bar is not in the global namespace
        }
    }
}

?>

This is no more the case in PHP 5, which relies on __construct() to do so. Having this old style constructor may bring in confusion, unless you are also supporting old time PHP 4.

Note that classes with methods bearing the class name, but inside a namespace are not following this convention, as this is not breaking backward compatibility. Those are excluded from the analyze.

See also [Constructors and Destructors ¶](http://php.net/manual/en/language.oop5.decon.php).
