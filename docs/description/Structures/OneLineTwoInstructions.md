Usually, instructions do not share their line : one instruction, one line. 

This is good for readability, and help at understanding the code. This is especially important when fast-reading the code to find some special situation, where such double-meaning line way have an impact.

<?php

switch ($x) {
    // Is it a fallthrough or not ? 
    case 1:
        doSomething(); break;

    // Easily spotted break.
    case 1:
        doSomethingElse(); 
        break;

    default : 
        doDefault(); 
        break;
}

?>

See also [Object Calisthenics, rule # 5](http://williamdurand.fr/2013/06/03/object-calisthenics/#one-dot-per-line).
