It is not possible to use a constant to define itself in a class. It yields a fatal error at runtime. 

The PHP error reads : ``Cannot declare self-referencing constant 'self::C2'``. Unlike PHP which is self-referencing, self referencing variables can't have a value : just don't use that.

<?php
    class a { 
        const C1 = 1;         // fully defined constant
        const C2 = self::C2;  // self referencing constant
        const C3 = a::C3 + 2; // self referencing constant
    }
?>

The code may access an already declared constant with self or with its class name.

<?php
    class a { 
        const C1 = 1; 
        const C2 = a::C1; 
    }
?>

This error is not detected by linting. It is only detected at instantation time : if the class is not used, it won't appear.

