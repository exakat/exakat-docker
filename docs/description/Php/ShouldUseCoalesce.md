PHP 7 introduced the ?? operator, that replaces longer structures to set default values when a variable is not set.

<?php

// Fetches the request parameter user and results in 'nobody' if it doesn't exist
$username = $_GET['user'] ?? 'nobody';
// equivalent to: $username = isset($_GET['user']) ? $_GET['user'] : 'nobody';
 
// Calls a hypothetical model-getting function, and uses the provided default if it fails
$model = Model::get($id) ?? $default_model;
// equivalent to: if (($model = Model::get($id)) === NULL) { $model = $default_model; }

?>

Sample extracted from PHP docs [Isset Ternary](https://wiki.php.net/rfc/isset_ternary).

See also [New in PHP 7: null coalesce operator](https://lornajane.net/posts/2015/new-in-php-7-null-coalesce-operator).

