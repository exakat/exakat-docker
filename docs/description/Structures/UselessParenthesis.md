Situations where parenthesis are not necessary, and may be removed.

Parenthesis group several elements together, and allows for a more readable expression. They are used with logical and mathematical expressions. They are necessary when the precedence of the operators are not the intended execution order : for example, when an addition must be performed before the multiplication.

Sometimes, the parenthesis provide the same execution order than the default order : they are deemed useless. 

<?php

    if ( ($condition) ) {}
    while( ($condition) ) {}
    do $a++; while ( ($condition) );
    
    switch ( ($a) ) {}
    $y = (1);
    ($y) == (1);
    
    f(($x));

    // = has precedence over == 
    ($a = $b) == $c;
    
    ($a++);
    
    // No need for parenthesis in default values
    function foo($c = ( 1 + 2) ) {}
?>

See also [Operators Precedence](http://php.net/manual/en/language.operators.precedence.php).
