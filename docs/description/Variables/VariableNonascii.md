PHP allows certain characters in variable names. The variable name must only include letters, figures, underscores and ASCII characters from 128 to 255. 

In practice, letters outside the scope of ``a-zA-Z0-9`` are rare, and require more care when editing the code or passing it from OS to OS. 

<?php

class 人 {
    // An actual working class in PHP.
    public function __construct() {
        echo __CLASS__;
    }
}

$people = new 人();

?>

See also [Variables](http://php.net/manual/en/language.variables.basics.php).
