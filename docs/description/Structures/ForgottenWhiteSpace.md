White spaces have been left at either end of a file : before the PHP opening tag, or after the closing tag. 

Usually, such white space are forgotten, and may end up summoning the infamous 'headers already sent' error. It is better to remove them. 

<?php
    // This script has no forgotten whitespace, not at the beginning
    function foo() {}

    // This script has no forgotten whitespace, not at the end
?>

See also [How to fix Headers already sent error in PHP](http://stackoverflow.com/questions/8028957/how-to-fix-headers-already-sent-error-in-php).
