Private methods that are not used are dead code. 

Private methods are reserved for the defining class. Thus, they must be used with $this or any variation of self:: 

<?php

class Foo {
    // Those methods are used
    private function method() {}
    private static function staticMethod() {}

    // Those methods are not used
    private function unusedMethod() {}
    private static function staticUnusedMethod() {}
    
    public function bar() {
        self::staticMethod();
        $this->method();
    }
}

?>
