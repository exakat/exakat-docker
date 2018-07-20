Undefined constants revert as strings in Arrays. They are also called ``barewords``.

In ``$array[index]``, PHP cannot find index as a constant, but, as a default behavior, turns it into the string ``index``. 

This default behavior raise concerns when a corresponding constant is defined, either using define() or the const keyword (outside a class). The definition of the index constant will modify the behavior of the index, as it will now use the constant definition, and not the 'index' string. 

<?php

// assign 1 to the element index in $array
// index will fallback to string
$array[index] = 1; 
//PHP Notice:  Use of undefined constant index - assumed 'index'

echo $array[index];      // display 1 and the above error
echo "$array[index]";    // display 1
echo "$array['index']";  // Syntax error


define('index', 2);
 
 // now 1 to the element 2 in $array
 $array[index] = 1;

?>

It is recommended to make index a real string (with ' or "), or to define the corresponding constant to avoid any future surprise.

Note that PHP 7.2 removes the support for this feature.

See also [PHP RFC: Deprecate and Remove Bareword (Unquoted) Strings](https://wiki.php.net/rfc/deprecate-bareword-strings) and 
         [Syntax](http://php.net/manual/en/language.constants.syntax.php).

