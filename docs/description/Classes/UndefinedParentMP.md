List of properties and methods that are accessed using ``parent`` keyword but are not defined in the parent class. 

This will be compilable but will yield a fatal error during execution.

<?php

class theParent {
    // No bar() method
    // private bar() method is not accessible to theChild 
}

class theChild extends theParent {
    function foo() {
        // bar is defined in theChild, but not theParent
        parent::bar();
    }
    
    function bar() {
    
    }
}

?>

Note that if the parent is defined using ``extends someClass`` but ``someClass`` is not available in the tested code, it will not be reported : it may be in composer, another dependency, or just missing.

See also [parent](http://php.net/manual/en/keyword.parent.php).
