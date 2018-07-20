Chain exception to provide more context.

When catching an exception and rethrowing another one, it is recommended to chain the exception : this means providing the original exception, so that the final recipient has a chance to track the origin of the problem. This doesn't change the thrown message, but provides more information.

Note : Chaining requires PHP > 5.3.0.

<?php
    try {
        throw new Exception('Exception 1', 1);
    } catch (\Exception $e) {
        throw new Exception('Exception 2', 2, $e); 
        // Chaining here. 

    }
?>

See also [Exception::__construct](http://php.net/manual/en/exception.construct.php).
