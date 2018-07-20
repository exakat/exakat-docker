The following properties are never used outside their class of definition  Given the analyzed code, they could be set as private. 

<?php

class foo {
    public $couldBePrivate = 1;
    public $cantdBePrivate = 1;
    
    function bar() {
        // couldBePrivate is used internally. 
        $this->couldBePrivate = 3;
    }
}

class foo2 extends foo {
    function bar2() {
        // cantdBePrivate is used in a child class. 
        $this->cantdBePrivate = 3;
    }
}

//$couldBePrivate is not used outside 
$foo = new foo();

//$cantdBePrivate is used outside the class
$foo->cantdBePrivate = 2;

?>

Note that dynamic properties (such as $x->$y) are not taken into account. 