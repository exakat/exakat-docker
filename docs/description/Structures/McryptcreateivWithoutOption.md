Avoid using [mcrypt_create_iv()](http://php.net/manual/en/function.mcrypt-create-iv.php) default values.

`mcrypt_create_iv() <http://php.net/manual/en/function.mcrypt-create-iv.php>` used to have `MCRYPT_DEV_RANDOM` as default values, and in PHP 5.6, it now uses `MCRYPT_DEV_URANDOM`.

<?php
    $size = mcrypt_get_iv_size(MCRYPT_CAST_256, MCRYPT_MODE_CFB);
    // mcrypt_create_iv is missing the second argument
    $iv = mcrypt_create_iv($size);

// Identical to the line below
//    $iv = mcrypt_create_iv($size, MCRYPT_DEV_RANDOM);

?>

If the code doesn't have a second argument, it relies on the default value. It is recommended to set explicitly the value, so has to avoid problems while migrating.

See also [mcrypt_create_iv()](http://php.net/manual/en/function.mcrypt-create-iv.php).
