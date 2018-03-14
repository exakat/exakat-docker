Undefined Properties
List of properties that are not explicitely defined in the class, its parents or traits.

<?php

class foo {
    // property definition
    private bar = 2;
    
    function foofoo() {
        // $this->bar is defined in the class
        // $this->barbar is NOT defined in the class
        return $this->bar + $this->barbar;
    }
}

?>

See also `Properties <http://php.net/manual/en/language.oop5.properties.php>`_.