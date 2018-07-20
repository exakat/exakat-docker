The instanceof operator doesn't confirm if the compared class exists. 

It checks if an variable is of a specific class. However, if the referenced class doesn't exist, because of a bug, a missed inclusion or a typo, the operator always fails, without a warning. 

<?php

namespace X {
    class C {}
    
    // This is OK, as C is defined in X
    if ($o instanceof C) { }

    // This is not OK, as C is not defined in global
    // instanceof respects namespaces and use expressions
    if ($o instanceof \C) { }

    // This is not OK, as undefinedClass
    if ($o instanceof undefinedClass) { }

    // This is not OK, as $class is now a full namespace. It actually refers to \c, which doesn't exist
    $class = 'C';
    if ($o instanceof $class) { }
}
?>

Make sure the following classes are well defined.

See also [Type operators](http://php.net/instanceof).
