At least two consecutive if/then structures use identical conditions. The latter will probably be ignored.

This analysis returns false positive when there are attempt to fix the situation, or to call an alternative solution. 

<?php

if ($a == 1) { doSomething(); }
elseif ($b == 1) { doSomething(); }
elseif ($c == 1) { doSomething(); }
elseif ($a == 1) { doSomething(); }
else {}

// Also works on if then else if chains
if ($a == 1) { doSomething(); }
else if ($b == 1) { doSomething(); }
else if ($c == 1) { doSomething(); }
else if ($a == 1) { doSomething(); }
else {}

// This sort of situation generate false postive. 
$config = load_config_from_commandline();
if (empty($config)) {
    $config = load_config_from_file();
    if (empty($config)) {
        $config = load_default_config();
    }
}

?>
