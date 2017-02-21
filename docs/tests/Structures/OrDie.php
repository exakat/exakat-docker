//#Patterns: Structures/OrDie
<?php

//#Warn: Structures/OrDie
mysqli_connect(1, 2, 3, 4) or exit( );

//#Warn: Structures/OrDie
mysql_connect(1, 2, 3, 4) or die( );

//#Warn: Structures/OrDie
ora_bind(1, 2, 3, 4) || die( );

die( ) || pg_connect(1, 2, 3, 4);

?>