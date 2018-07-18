PHP magic methods, such as __get(), __set(), ... are supposed to be used in an object environnement, and not with direct call. 

It is recommended to use the magic method with its intended usage, and not to call it directly. For example, typecast to ``string`` instead of calling the ``__toString()`` method.

<?php
// Write
  print $x->a;
// instead of 
  print $x->__get('a'); 

class Foo {
    private $b = secret;

    public function __toString() {
        return strtoupper($this->b);
    }
}

$bar = new Foo();
echo (string) $bar;

?>

Accessing those methods in a static way is also discouraged.

See also [Magic Methods](http://php.net/manual/en/language.oop5.magic.php) and 
         [Magical PHP: __call()](https://www.garfieldtech.com/blog/magical-php-call).
