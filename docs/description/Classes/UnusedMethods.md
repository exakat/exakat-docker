Those methods are never called as methods. 

They are probably dead code, unless they are called dynamically.

<?php

class foo {
    public function used() {
        $this->used();
    }

    public function unused() {
        $this->used();
    }
}

class bar extends foo {
    public function some() {
        $this->used();
    }
}

$a = new foo();
$a->used();

?>
