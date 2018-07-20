Avoid __autoload(), only use spl_register_autoload().

__autoload() will be deprecated in PHP 7.2 and possibly removed in later version.

__autoload() may only be declared once, and cannot be modified later. This creates potential conflicts between libraries that try to set up their own autoloading schema. 

On the other hand, spl_register_autoload() allows registering and de-registering multiple autoloading functions or methods. 

<?php

// Modern autoloading.
function myAutoload($class){}
spl_register_autoload('myAutoload');

// Old style autoloading.
function __autoload($class){}

?>

Do not use the old __autoload() function, but rather the new spl_register_autoload() function. 

See also [Autoloading Classe](http://php.net/manual/en/language.oop5.autoload.php).
