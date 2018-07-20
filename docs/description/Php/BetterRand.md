rand() and mt_rand() should be replaced with random_int().

At worse, rand() should be replaced with mt_rand(), which is a drop-in replacement and srand() by mt_srand(). 

random_int() replaces rand(), and has no seeding function like srand().

Other sources of entropy that should be replaced by random_int() : microtime(), uniqid(), time(). Those a often combined with hashing functions and mixed with other sources of entropy, such as a salt.

<?php

// Avoid using this
$random = rand(0, 10);

// Drop-in replacement
$random = mt_rand(0, 10);

// Even better but different : 
// valid with PHP 7.0+
try {
    $random = random_int(0, 10);
} catch (\Exception $e) {
    // process case of not enoug random values
}

// This is also a source of entropy, based on srand()
// It may simply be replaced by random_int()
$a = sha256(uniqid());

?>

Since PHP 7, random_int() along with random_bytes(), provides cryptographically secure pseudo-random bytes, which are good to be used
when security is involved. openssl_random_pseudo_bytes() may be used when the OpenSSL extension is available.

See also [CSPRNG](http://php.net/manual/en/book.csprng.php) and [OpenSSL](http://php.net/manual/en/book.openssl.php).
