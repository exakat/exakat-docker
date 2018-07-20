Resources are created, but never checked before being used. This is not safe.

Always check that resources are correctly created before using them.

<?php

// always check that the resource is created correctly
$fp = fopen($d,'r');
if ($fp === false) {
    throw new Exception('File not found');
} 
$firstLine = fread($fp);

// This directory is not checked : the path may not exist and return false
$uncheckedDir = opendir($pathToDir);
while(readdir($uncheckedDir)) {
    // do something()
}

// This file is not checked : the path may not exist or be unreadable and return false
$fp = fopen($pathToFile);
while($line = freads($fp)) {
    $text .= $line;
}

// quick unsafe one-liner : using bzclose on an unchecked resource
bzclose(bzopen('file'));

?>

See also [resources](http://php.net/manual/en/language.types.resource.php).
