In catch blocks, it is good practice not to overwrite the incoming exception, as information about the exception will be lost.

<?php

try {
    doSomething();
} catch (SomeException $e) { 
    // $e is overwritten 
    $e = new anotherException($e->getMessage()); 
    throw $e;
} catch (SomeOtherException $e) { 
    // $e is chained with the next exception 
    $e = new Exception($e->getMessage(), 0, $e); 
    throw $e;
}

?>
