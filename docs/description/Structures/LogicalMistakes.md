Avoid logical mistakes within long expressions. 

Sometimes, the logic is not what it seems. It is important to check the actual impact of every part of the logical expression. Do not hesitate to make a table with all possible cases. If those cases are too numerous, it may be time to rethink the whole expression. 

<?php 

// Always false
if ($a != 1 || $a != 2) { } 

// $a == 1 is useless
if ($a == 1 || $a != 2) {}

// Always false
if ($a == 1 && $a == 2) {}

// $a != 2 is useless
if ($a == 1 && $a != 2) {}

?>

Based on article from Andrey Karpov  [Logical Expressions in C/C++. Mistakes Made by Professionals](http://www.viva64.com/en/b/0390/)

