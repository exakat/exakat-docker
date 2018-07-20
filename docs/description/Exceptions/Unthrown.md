These are exceptions that are defined in the code but never thrown. 

<?php

//This exception is defined but never used in the code.
class myUnusedException extends \Exception {}

//This exception is defined and used in the code.
class myUsedException extends \Exception {}

throw new myUsedException('I was called');

?>

See also [Exceptions](http://php.net/manual/en/language.exceptions.php).
