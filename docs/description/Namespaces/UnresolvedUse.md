The following use instructions cannot be resolved to a class or a namespace. They should be dropped or fixed.

<?php

namespace A {
    // class B is defined
    class B {}
    // class C is not defined
}

namespace X/Y {

    use A/B;  // This use is valid
    use A/C;  // This use point to nothing.

    new B();
    new C();
}

?>

Use expression are options for the current namespace. 

See also [Using namespaces: Aliasing/Importing](http://php.net/manual/en/language.namespaces.importing.php).

