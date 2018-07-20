The try/catch structure uses some variables that also in use in this scope. In case of a caught exception, the exception will be put in the catch variable, and overwrite the current value, loosing some data.

<?php

// variables and caught exceptions are distinct
$argument = 1;
try {
    methodThatMayRaiseException($argument);
} (Exception $e) {
    // here, $e has been changed to an exception.
}

// variables and caught exceptions are overlapping
$e = 1;
try {
    methodThatMayRaiseException();
} (Exception $e) {
    // here, $e has been changed to an exception.
}

?>

It is recommended to use another name for these catch variables.