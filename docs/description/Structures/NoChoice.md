A conditional structure is being used, but both alternatives are the same, leading to the illusion of choice. 

Either the condition is useless, and may be removed, or the alternatives need to be distinguished.

<?php

if ($condition == 2) {
    doSomething();
} else {
    doSomething();
}

$condition == 2 ?     doSomething() :     doSomething();

?>


