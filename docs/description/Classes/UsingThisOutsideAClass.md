``$this`` is a special variable, that should only be used in a class context. 

Until PHP 7.1, ``$this`` may be used as an argument in a function or a method, a global, a static : while this is legit, it sounds confusing enough to avoid it.

<?php

function foo($this) {
    echo $this;
}

// A closure can be bound to an object at later time. It is valid usage.
$closure = function ($x) {
    echo $this->foo($x);
}

?>

Starting with PHP 7.1, the PHP engine check thoroughly that ``$this`` is used in an appropriate manner, and raise fatal errors in case it isn't. 

Yet, it is possible to find ``$this`` outside a class : if the file is included inside a class, then ``$this`` will be recognized and valided. If the file is included outside a class context, it will yield a fatal error : ``Using $this when not in object context``.

See also [Closure::bind](http://php.net/manual/en/closure.bind.php) and 
         [The Basics](http://php.net/manual/en/language.oop5.basic.php).

