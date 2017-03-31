//#Patterns: Functions/WrongOptionalParameter
<?php
function optionalOK ($x = 1) {}
function optionalOK1 ($x) {}
function optionalOK2 ($x, $y) {}
function optionalOK3 ($x, $y = 2) {}
function optionalOK4 ($x, $y, $z) {}
function optionalOK5 ($x, $y, $z=3) {}
function optionalOK6 ($x, $y=2, $z=3) {}
function optionalOK7 ($x=1, $y=2, $z=3) {}

//#Warn: Functions/WrongOptionalParameter
function optionalKO2 ($x = 1, $y) {}
//#Warn: Functions/WrongOptionalParameter
function optionalKO3 ($x = 1, $y = 2, $z) {}
//#Warn: Functions/WrongOptionalParameter
function optionalKO23 ($x = 1, $y, $z) {}

//#Warn: Functions/WrongOptionalParameter
function optionalKO234 ($x = 1, $y, $z, $a) {}
//#Warn: Functions/WrongOptionalParameter
function optionalKO134 ($x, $y = 1, $z, $a) {}
//#Warn: Functions/WrongOptionalParameter
function optionalKO4 ($x, $y, $z = 1, $a) {}
//#Warn: Functions/WrongOptionalParameter
function optionalKO34 ($x = 1, $y = 2, $z, $a) {}
//#Warn: Functions/WrongOptionalParameter
function optionalKO24 ($x = 1, $y, $z = 2, $a) {}
//#Warn: Functions/WrongOptionalParameter
function optionalKO23b ($x = 1, $y, $z, $a = 3) {}

?>