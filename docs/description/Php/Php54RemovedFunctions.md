Those functions were removed in PHP 5.4.

<?php

// Deprecated as of PHP 5.4.0
$link = mysql_connect('localhost', 'mysql_user', 'mysql_password');
$db_list = mysql_list_dbs($link);

while ($row = mysql_fetch_object($db_list)) {
     echo $row->Database . "\n";
}

?>

See also [Deprecated features in PHP 5.4.x](http://php.net/manual/en/migration54.deprecated.php).
