``time()`` and ``microtime()`` shouldn't be used to calculate duration. 

[`time()`` and ``microtime()`` are subject to variations, depending on system clock variations, such as daylight saving time difference (every spring and fall, one hour variation), or leap seconds, happening on ``June, 30th`` or ``December 31th``, as announced by `IERS](https://www.iers.org/IERS/EN/Home/home_node.html).

<?php

// Calculating tomorow, same hour, the wrong way
// tomorrow is not always in 86400s, especially in countries with daylight saving 
$tomorrow = time()  + 86400; 

// Good way to calculate tomorrow
$datetime = new DateTime('tomorrow');

?>

When the difference may be rounded to a larger time unit (rounding the difference to days, or several hours), the variation may be ignored safely.

When the difference is very small, it requires a better way to measure time difference, such as `Ticks <http://php.net/manual/en/control-structures.declare.php#control-structures.declare.ticks>'_, 
`ext/hrtime <http://php.net/manual/en/book.hrtime.php>'_, or including a check on the actual time zone (``ini_get()`` with 'date.timezone'). 

See also [PHP DateTime difference – it’s a trap!](http://blog.codebusters.pl/en/php-datetime-difference-trap/) and 
           [PHP Daylight savings bug?](https://stackoverflow.com/questions/22519091/php-daylight-savings-bug).
