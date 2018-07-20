When using conditions, it is recommended to quit in the current context, and avoid else clause altogether. 

The main benefit is to make clear the method applies a condition, and stop quickly went it is not satisfied. 
The main sequence is then focused on the useful code. 

This works with the break, continue, throw and goto keywords too, depending on situations.

<?php

// Bailing out early, low level of indentation
function foo1($a) {
    if ($a > 0) {
        return false;
    } 
    
    $a++;
    return $a;
}

// Works with continue too
foreach($array as $a => $b) {
    if ($a > 0) {
        continue false;
    } 
    
    $a++;
    return $a;
}

// No need for else
function foo2($a) {
    if ($a > 0) {
        return false;
    } else {
        $a++;
    }
    
    return $a;
}

// No need for else : return goes into then. 
function foo3($a) {
    if ($a < 0) {
        $a++;
    } else {
        return false;
    }
    
    return $a;
}

// Make a return early, and make the condition clearly visible.
function foo3($a) {
    if ($a < 0) {
        $a++;
        methodcall();
        functioncall();
    } 
}

?>

See also [Avoid nesting too deeply and return early (part 1)](https://github.com/jupeter/clean-code-php#avoid-nesting-too-deeply-and-return-early-part-1) and 
         [Avoid nesting too deeply and return early (part 2)](https://github.com/jupeter/clean-code-php#avoid-nesting-too-deeply-and-return-early-part-2).

