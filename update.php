<?php

$php = file_get_contents('../analyzeG3/library/Exakat/Exakat.php');
preg_match('/const VERSION = \'([\d\.]+)\'/m', $php, $r);

$version = $r[1];

$php = file_get_contents('Dockerfile');
if (!preg_match('/ENV EXAKAT_VERSION ([\d\.]+)/m', $php, $r)) {
    die('No version in Dockerfile'.PHP_EOL);
}

$old = $r[1];

print "$old -> $version\n";

$php = str_replace($old, $version, $php);
file_put_contents('Dockerfile', $php);


$md = file_get_contents('README.md');
$md = str_replace($old, $version, $md);

file_put_contents('README.md', $md);

#shell_exec('git stage Dockerfile README.md; git commit -m "Update to version '.$version.'   "; git push -u exakatGithub');



?>