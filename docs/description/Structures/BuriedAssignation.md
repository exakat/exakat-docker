Those assignations are buried in the code, and placed in unexpected situations. 

They are difficult to spot, and may be confusing. It is advised to place them in a more visible place.

<?php

// $b may be assigned before processing $a
$a = $c && ($b = 2);

// legit syntax, but the double assignation is not obvious.
for($i = 2, $j = 3; $j < 10; $j++) {
    
}
?>

