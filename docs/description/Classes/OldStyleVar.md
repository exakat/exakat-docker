Var was used in PHP 4 to mark properties as public. Nowadays, new keywords are available : public, protected, private. Var is equivalent to public. 

It is recommended to avoid using var, and explicitly use the new keywords.

<?php

class foo {
    public $bar = 1;
    // Avoid var
    //var $bar = 1; 
}

?>

See also [Visibility](http://php.net/manual/en/language.oop5.visibility.php).
