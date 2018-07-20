``eval()`` emits a ``ParseError`` exception with PHP 7 and later. Catching this exception is the recommended way to handle errors when using the ``eval()`` function.

<?php

$code = 'This is no PHP code.';

//PHP 5 style
eval($code);
// Ends up with a Fatal error, at execution time

//PHP 7 style
try {
    eval($code);
} catch (ParseError $e) {
    cleanUpAfterEval();
}

?>

Note that it will catch situations where ``eval()`` is provided with code that can't be used, but it will not catch security problems. Avoid using ``eval()`` with incoming data.
