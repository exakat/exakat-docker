//#Patterns: Functions/AliasesUsage
<?php

number_format(1, 2, 3, 4, 5);

//#Warn: Functions/AliasesUsage
chop(1);
//#Warn: Functions/AliasesUsage
ini_ALTER(1,2);

$x->pos(); // this one is good, it's a method! 

?>