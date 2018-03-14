Implement Is For Interface
With class heritage, implements should be used for interfaces, and extends with classes.

PHP defers the implements check until execution : the code in example does lint, but won,t run.

<?php

class x {}

interface y {}

// This is wrong
class z implements x {}

?>
