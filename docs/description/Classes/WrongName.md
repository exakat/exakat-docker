PHP has reserved usage of methods starting with ``__`` for magic methods. It is recommended to avoid using this prefix, to prevent confusions.

<?php

class foo{
    // Constructor
    function __construct() {}

    // Constructor's typo
    function __constructor() {}

    // Illegal function name, even as private
    private function __bar() {}
}

?>

See also [Magic Methods](http://php.net/manual/en/language.oop5.magic.php).
