List of all static properties that are not used. They look like dead code.

<?php

class foo {
    // This is a used property (see bar method)
    private $used = 1;

    // This is an unused property
    private $unused = 2;
    
    function bar($a) {
        $this->used += $a;
        
        return $this->used;
    }
}

?>

