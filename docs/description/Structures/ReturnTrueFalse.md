These conditional expressions return true/false, depending on the condition. This may be simplified by dropping the control structure altogether.

<?php

if (version_compare($a, $b) >= 0) {
    return true;
} else {
    return false;
}

?>

This may be simplified with : 

<?php

return version_compare($a, $b) >= 0;

?>

This may be applied to assignations and ternary operators too.

<?php

if (version_compare($a, $b) >= 0) {
    $a = true;
} else {
    $a = false;
}

$a = version_compare($a, $b) >= 0 ? false : true;

?>

 