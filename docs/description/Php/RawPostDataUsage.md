$HTTP_RAW_POST_DATA is deprecated, and should be replaced by php://input. 

$HTTP_RAW_POST_DATA is deprecated since PHP 5.6.

It is possible to ready by setting always_populate_raw_post_data to -1.

<?php

// PHP 5.5 and older
$postdata = $HTTP_RAW_POST_DATA;

// PHP 5.6 and more recent
$postdata = file_get_contents(php://input);

?>

See also [$HTTP_RAW_POST_DATA variable](http://php.net/manual/en/reserved.variables.httprawpostdata.php).

