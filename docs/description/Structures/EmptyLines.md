Empty instructions are part of the code that have no instructions. 

This may be trailing semi-colon or empty blocks for if-then structures.

Comments that explains the reason of the situation are not taken into account.

<?php
    $condition = 3;;;;
    if ($condition) { } 
?>

