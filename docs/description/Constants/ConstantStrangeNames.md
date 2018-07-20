List of constants being defined with names that are incompatible with PHP standards. 

<?php

// Define a valid PHP constant
define('ABC', 1); 
const ABCD = 2; 

// Define an invalid PHP constant
define('ABC!', 1); 
echo defined('ABC!') ? constant('ABC!') : 'Undefined';

// Const doesn't allow illegal names

?>

See also [PHP Constants](http://php.net/manual/en/language.constants.php).

