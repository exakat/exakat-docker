Useless Constructor
Class constructor that have empty bodies are useless. They may be removed.

<?php

class X {
    function __construct() {
        // Do nothing
    }
}

class Y extends X {
    // Useful constructor, as it prevents usage of the parent
    function __construct() {
        // Do nothing
    }
}

?>
