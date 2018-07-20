Simply omit any unused variable in a list() call. 

list() is the only PHP function that accepts to have omitted arguments. If the following code makes no usage of a listed variable, just omit it. 

<?php
    // No need for '2', so no assignation
    list ($a, , $b) = array(1, 2, 3);
        // works with PHP 7.1 short syntax
         [$a, , $b] = array(1, 2, 3);

    // No need for '2', so no assignation
    list ($a, $c, $b) = array(1, 2, 3);
?>

See also [list](http://php.net/manual/en/function.list.php).

