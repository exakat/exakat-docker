The following functions are deprecated. Whatever the version you are using, it is recommended to stop using them and replace them with a durable equivalent. 

Functions may be still usable : they generate warning that help you track their usage. Watch your logs, and target any deprecated warning. This way, you won't be stuck when the function is actually removed.

<?php

// This is the current function
list($day, $month, $year) = explode('/', '08/06/1995');

// This is deprecated
list($day, $month, $year) = split('/', '08/06/1995');

?>

