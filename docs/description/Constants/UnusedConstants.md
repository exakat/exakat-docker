Those constants are defined in the code but never used. Defining unused constants slow down the application, as they are executed and stored in PHP hashtables. 

<?php

// const-defined constant
const USED_CONSTANT  = 0;
const UNUSED_CONSTANT = 1 + USED_CONSTANT;

// define-defined constant
define('ANOTHER_UNUSED_CONSTANT', 3);

?>

It is recommended to comment them out, and only define them when it is necessary.