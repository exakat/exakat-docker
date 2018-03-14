Unused Static Methods
List of all static methods that are not used. This looks like dead code.

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
