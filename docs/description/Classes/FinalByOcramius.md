'Make your classes always final, if they implement an interface, and no other public methods are defined'.

When a class should be final, as explained by Ocramius (Marco Pivetta).

<?php

interface i1 {
    function i1() ;
}

// Class should final, as its public methods are in an interface
class finalClass implements i1 {
    // public interface 
    function i1 () {}
    
    // private method
    private function a1 () {}
}

?>

See also [When to declare classes final](http://ocramius.github.io/blog/when-to-declare-classes-final/).

