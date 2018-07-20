This expression may be reduced by casting to boolean type. 

<?php

$variable = $condition == 'met' ? 1 : 0;
// Same as 
$variable = (bool) $condition == 'met';

$variable = $condition == 'met' ? 0 : 1;
// Same as (Note the condition inversion)
$variable = (bool) $condition != 'met';
// also, with an indentical condition
$variable = !(bool) $condition == 'met';

// This also works with straight booleans expressions
$variable = $condition == 'met' ? true : false;
// Same as 
$variable = $condition == 'met';

?>

