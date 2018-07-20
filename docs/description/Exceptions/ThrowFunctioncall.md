The throw keyword is excepted to use an exception. Calling a function to prepare that exception before throwing it is possible, but forgetting the new keyword is also possible. 

<?php

// Forgotten new
throw \RuntimeException('error!');

// Code is OK, function returns an exception
throw getException(ERROR_TYPE, 'error!');

function getException(ERROR_TYPE, $message) {
    return new \RuntimeException($messsage);
}

?>

When the new keyword is forgotten, then the class construtor is used as a functionname, and now exception is emited, but an 'Undefined function' fatal error is emited. 

See also [Exceptions](http://php.net/manual/en/language.exceptions.php).
