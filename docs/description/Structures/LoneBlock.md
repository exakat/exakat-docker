Any grouped code without a commanding structure is useless. 

Blocks are compulsory when defining a structure, such as a class or a function. They are most often used with flow control instructions, like if then or switch. 

Blocks are also valid syntax that group several instructions together, though they have no effect at all, except confuse the reader. Most often, it is a ruin from a previous flow control instruction, whose condition was removed or commented. They should be removed. 

<?php

    // Lone block
    //foreach($a as $b) 
    {
        $b++;
    }
?>

