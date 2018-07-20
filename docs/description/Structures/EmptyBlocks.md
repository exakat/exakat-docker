Full empty block, part of a control structures. 

It is recommended to remove those blocks, so as to reduce confusion in the code. 

<?php

foreach($foo as $bar) ; // This block seems erroneous
    $foobar++;

if ($a === $b) {
    doSomething();
} else {
    // Empty block. Remove this
}

// Blocks containing only empty expressions are also detected
for($i = 0; $i < 10; $i++) {
    ;
}

// Although namespaces are not control structures, they are reported here
namespace A;
namespace B;

?>

