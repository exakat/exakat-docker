Foreach statement may loop using a reference, especially when the loop has to change values of the array it is looping on. 

In the spotted loop, reference are used but never modified. They may be removed.

<?php

$letters = range('a', 'z');

// $letter is not used here
foreach($letters as &$letter) {
    $alphabet .= $letter;
}

// $letter is actually used here
foreach($letters as &$letter) {
    $letter = strtoupper($letter);
}

?>

