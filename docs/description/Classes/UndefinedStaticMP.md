List of all undefined static and self properties and methods.

<?php

class x {
    static public function definedStatic() {}
    private definedStatic = 1;
    
    public function method() {
        self::definedStatic();
        self::undefinedStatic();

        static::definedStatic;
        static::undefinedStatic;
    }
}

?>

