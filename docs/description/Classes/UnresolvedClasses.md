The following classes are instantiated in the code, but their definition couldn't be found. 

Check for namespaces and aliases and make sure they are correctly configured.

<?php

class Foo extends Bar {
    private function foobar() {
        // here, parent is not resolved, as Bar is not defined in the code.
        return parent::$prop;
    }
}

?>

