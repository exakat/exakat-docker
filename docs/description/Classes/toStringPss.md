The class magic methods must have public visibility and cannot be static.

<?php

class foo{
    // magic method must bt public and non-static
    public static function __clone($name) {    }

    // magic method can't be private
    private function __get($name) {    }

    // magic method can't be protected
    private function __set($name, $value) {    }

    // magic method can't be static
    public static function __isset($name) {    }
}

?>

See also [Magic methods](http://php.net/manual/en/language.oop5.magic.php).
