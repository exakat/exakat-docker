Structures, such as functions, classes, interfaces, traits, etc. may be defined anywhere in the code, including inside functions. This is legit code for PHP. 

Since the availability of __autoload, there is no need for that kind of code. Structures should be defined, and accessible to the autoloading. Inclusion and deep definitions should be avoided, as they compell code to load some definitions, while autoloading will only load them if needed. 

<?php

class X {
    function init() {
        // myFunction is defined when and only if X::init() is called.
        if (!function_exists('myFunction'){
            function myFunction($a) {
                return $a + 1;
            }
        })
    }
}

?>

Functions are excluded from autoload, but shall be gathered in libraries, and not hidden inside other code.

Constants definitions are tolerated inside functions : they may be used for avoiding repeat, or noting the usage of such function. 

See also [Autoloading Classe](http://php.net/manual/en/language.oop5.autoload.php).
