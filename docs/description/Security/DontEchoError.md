It is recommended to avoid displaying error messages directly to the browser.

PHP's uses the 'display_errors' directive to control display of errors to the browser. This must be kept to 'off' when in production.

<?php

// Inside a 'or' test
mysql_connect('localhost', $user, $pass) or die(mysql_error());

// Inside a if test
$result = pg_query( $db, $query );
if( !$result )
{
	echo Erreur SQL: . pg_error();
	exit;
}

// Changing PHP configuration
ini_set('display_errors', 1);
// This is also a security error : 'false' means actually true.
ini_set('display_errors', 'false');

?>

Error messages should be logged, but not displayed. 

See also [Error reporting](https://php.earth/docs/security/intro#error-reporting) and 
         [List of php.ini directives](http://php.net/manual/en/ini.list.php).

