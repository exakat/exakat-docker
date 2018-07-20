Those are integer literals that are cast to a float when running PHP. They are simply too big for the current PHP version, and PHP resorts to cast them into a float, which has a much larger capacity but a lower precision.

Compare your literals to ``PHP_MAX_INT`` (typically ``9223372036854775807``) and ``PHP_MIN_INT`` (typically ``-9223372036854775808``).
This applies to binary (``0b10101``...), octals (``0123123``...) and hexadecimals (``0xfffff``...) too. 

<?php

echo 0b1010101101010110101011010101011010101011010101011010101011010111;
//6173123008118052203
echo 0b10101011010101101010110101010110101010110101010110101010110101111;
//1.2346246016236E+19

echo 0123123123123123123123;
//1498121094048818771
echo 01231231231231231231231;
//1.1984968752391E+19

echo 0x12309812311230;
//5119979279159856
echo 0x12309812311230fed;
//2.0971435127439E+19

echo 9223372036854775807; //PHP_MAX_INT
//9223372036854775807
echo 9223372036854775808;
9.2233720368548E+18

?>

See also [Integer overflow](http://php.net/manual/en/language.types.integer.php#language.types.integer.overflow).

