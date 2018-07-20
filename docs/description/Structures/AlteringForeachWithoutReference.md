Foreach() loop that should use a reference. 

When using a foreach loop that modifies the original source, it is recommended to use referenced variables, rather than access the original value with $source[$index]. 

Using references is then must faster, and easier to read. 

<?php

// Using references in foreach
foreach($source as $key => &$value) {
    $value = newValue($value, $key);
}

// Avoid foreach : use array_map
$source = array_walk($source, 'newValue');
    // Here, $key MUST be the second argument or newValue

// Slow version to update the array
foreach($source as $key => &$value) {
    $source[$key] = newValue($value, $key);
}
?>

You may also use array_walk() or array_map() (when $key is not used) to avoid the use of foreach.

See also [Foreach](http://php.net/manual/en/control-structures.foreach.php).

