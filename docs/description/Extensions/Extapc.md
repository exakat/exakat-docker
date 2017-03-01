Extension [Alternative PHP Cache](http://php.net/apc).

<?php
$bar = 'BAR';
apc_add('foo', $bar);
var_dump(apc_fetch('foo'));
echo \n;
$bar = 'NEVER GETS SET';
apc_add('foo', $bar);
var_dump(apc_fetch('foo'));
echo \n;
?>

