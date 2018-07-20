PHP requires a salt when calling crypt(). 5.5 and previous versions didn't require it. Salt is a simple string, that is usually only known by the application.

According to the manual : The salt parameter is optional. However, crypt() creates a weak hash without the salt. PHP 5.6 or later raise an E_NOTICE error without it. Make sure to specify a strong enough salt for better security.

<?php
// Set the password
$password = 'mypassword';

// Get the hash, letting the salt be automatically generated
// This generates a notice after PHP 5.6
$hash = crypt($password);


$hash = crypt($password);

?>

See also [crypt](http://www.php.net/crypt).
