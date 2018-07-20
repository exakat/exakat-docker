Within a class, there is both a property and variables bearing the same name. 

<?php
class Object {
    private $x;
    
    function SetData( ) {
        $this->x = $x + 2;
    }
}
?>

The property and the variable may easily be confused one for another and lead to a bug. 

Sometimes, when the property is going to be replaced by the incoming argument, or data based on that argument, this naming schema is made on purpose, indicating that the current argument will eventually end up in the property. When the argument has the same name as the property, no warning is reported.
