Empty Namespace
Declaring a namespace in the code and not using it for structure declarations or global instructions is useless.

Using simple style : 

<?php

namespace Y;

class foo {}


namespace X;
// This is useless

?>

Using bracket-style syntax : 

<?php

namespace X {
    // This is useless
}

namespace Y {

    class foo {}

}

?>


