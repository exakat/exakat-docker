The following exceptions are thrown in the code, but are never caught. 

<?php

// This exception is throw, but not caught. It will lead to a fatal error.
if ($message = check_for_error()) {
    throw new My\Exception($message);
}

// This exception is throw, and caught. 
try {
    if ($message = check_for_error()) {
        throw new My\Exception($message);
    }
} catch (\Exception $e) {
    doSomething();
}

?>

Either they will lead to a fatal error, or they have to be caught by a larger application. 