The following classes are never explicitely used in the code.

Note that this may be valid in case the current code is a library or framework, since it defines classes that are used by other (unprovided) codes.
Also, this analyzer may find classes that are, in fact, dynamically loaded. 

<?php

class unusedClasss {}
class usedClass {}

$y = new usedClass();

?>

