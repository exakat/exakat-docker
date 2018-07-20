There is no need to create references for objects, as those are always passed by reference when used as arguments.

<?php
    
    $object = new stdClass();
    $object->name = 'a';
    
    foo($object);
    print $object->name; // Name is 'b'
    
    // No need to make $o a reference
    function foo(&$o) {
        $o->name = 'b';
    }
    
    $array = array($object);
    foreach($array as &$o) { // No need to make this a reference
        $o->name = 'c';
    }

?>

See also [Passing by reference](http://php.net/manual/en/language.references.pass.php).
