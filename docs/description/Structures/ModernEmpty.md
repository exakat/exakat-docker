empty() accept expressions since PHP 5.5. There is no need to store the expression in a variable before testing, unless it is reused later.

<?php

// PHP 5.5+ empty() usage
if (empty(strtolower($b . $c))) {
    doSomethingWithoutA();
}

// Compatible empty() usage
$a = strtolower($b . $c);
if (empty($a)) {
    doSomethingWithoutA();
}

// $a2 is reused, storage is legit
$a2 = strtolower($b . $c);
if (empty($a2)) {
    doSomething();
} else {
    echo $a2;
}

?>

See also [empty()](http://www.php.net/manual/en/function.empty.php).
