The following functions have related constants that should be used as arguments, instead of scalar literals, such as integers or strings.

<?php

// The file is read and new lines are ignored.
$lines = file('file.txt', FILE_IGNORE_NEW_LINES)

// What is this doing, with 2 ? 
$lines = file('file.txt', 2);

?>

