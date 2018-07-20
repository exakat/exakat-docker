Some methods and functions are defined to be used with constants as arguments. Those constants are made to be meaningful and readable, keeping the code maintenable. It is recommended to use such constants as soon as they are documented.

<?php

// Turn off all error reporting
// 0 and -1 are accepted 
error_reporting(0);

// Report simple running errors
error_reporting(E_ERROR | E_WARNING | E_PARSE);

// The first argument can be one of INPUT_GET, INPUT_POST, INPUT_COOKIE, INPUT_SERVER, or INPUT_ENV.
$search_html = filter_input(INPUT_GET, 'search', FILTER_SANITIZE_SPECIAL_CHARS);

// sort accepts one of SORT_REGULAR, SORT_NUMERIC, SORT_STRING, SORT_LOCALE_STRING, SORT_NATURAL
// SORT_FLAG_CASE may be added, and combined with SORT_STRING or SORT_NATURAL
sort($fruits);

?>

