This code structure is quite old : it should be replace by the more modern and efficient foreach.

This structure is deprecated since PHP 7.2. It may disappear in the future.

<?php

    while(list($key, $value) = each($array)) {
        doSomethingWith($key) and $value();
    }

    foreach($array as $key => $value) {
        doSomethingWith($key) and $value();
    }
?> 

See also [PHP RFC: Deprecations for PHP 7.2 : Each()](https://wiki.php.net/rfc/deprecations_php_7_2#each).
