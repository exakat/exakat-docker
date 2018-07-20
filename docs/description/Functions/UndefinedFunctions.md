Some functions are called, but not defined in the code. This means that the functions are probably defined in a missing library, or in an extension. If not, this will yield a Fatal error at execution.

<?php

// Undefined function 
foo($a);

// valid function, as it belongs to the ext/yaml extension
$parsed = yaml_parse($yaml);

// This function is not defined in the a\b\c namespace, nor in the global namespace
a\b\c\foo(); 

?>

