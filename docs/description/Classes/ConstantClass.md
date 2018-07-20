A class or an interface only made up of constants. Constants usually have to be used in conjunction of some behavior (methods, class...) and never alone. 

<?php

class ConstantClass {
    const KBIT = 1000;
    const MBIT = self::KBIT * 1000;
    const GBIT = self::MBIT * 1000;
    const PBIT = self::GBIT * 1000;
}

?>

As such, they should be PHP constants (build with define or const), or included in a class with other methods and properties. 

See also [PHP Classes containing only constants](https://stackoverflow.com/questions/16838266/php-classes-containing-only-constants).
