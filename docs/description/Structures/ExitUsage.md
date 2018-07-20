Using exit or die() in the code makes the code untestable (it will break unit tests). Moreover, if there is no reason or string to display, it may take a long time to spot where the application is stuck. 

<?php

// Throw an exception, that may be caught somewhere
throw new \Exception('error');

// Dying with error message. 
die('error');

function foo() {
    //exiting the function but not dying
    if (somethingWrong()) {
        return true;
    }
}
?>

Try exiting the function/class with return, or throw exception that may be caught later in the code.
