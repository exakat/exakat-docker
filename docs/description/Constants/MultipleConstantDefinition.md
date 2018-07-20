Some constants are defined several times in your code. This will lead to a fatal error, if they are defined during the same execution. 

Multiple definitions may happens at boostrap, when the application code is collecting information about the current environnement. It may also happen at inclusion time, which one set of constant being loaded, while other definition are not, avoiding conflict. Both are false positive. 

<?php

// OS is defined twice. 
if (PHP_OS == 'Windows') {
    define('OS', 'Win');
} else {
    define('OS', 'Other');
}

?>

