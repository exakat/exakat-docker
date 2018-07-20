Use __DIR__ constant to access the current file's parent directory. 

Avoid using dirname() on __FILE__.

<?php

// Better way
$fp = fopen(__DIR__.'/myfile.txt', 'r');

// compatible, but slow way
$fp = fopen(dirname(__FILE__).'/myfile.txt', 'r');

// Since PHP 5.3
assert(dirname(__FILE__) == __DIR__);

?>

__DIR__ has been introduced in PHP 5.3.0.

See also [Magic Constants](http://php.net/manual/en/language.constants.predefined.php).

