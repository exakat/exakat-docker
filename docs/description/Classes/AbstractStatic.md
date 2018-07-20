Methods cannot be both abstract and static. Static methods belong to a class, and will not be overridden by the child class. For normal methods, PHP will start at the object level, then go up the hierarchy to find the method. With static, you have to mention the name, or use Late Static Binding, with self or static. Hence, it is useless to have an abstract static method : it should be a simple static method.

A child class is able to declare a method with the same name than a static method in the parent, but those two methods will stay independant. 

This is not the case anymore in PHP 7.0+.

<?php

abstract class foo {
    // This is not possible
    static abstract function bar() ;
}

?>

See also [Why does PHP 5.2+ disallow abstract static class methods?](https://stackoverflow.com/questions/999066/why-does-php-5-2-disallow-abstract-static-class-methods).
