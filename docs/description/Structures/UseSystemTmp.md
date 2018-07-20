It is recommended to avoid hardcoding the temporary file. It is better to rely on the system's temporary folder, which is accessible with sys_get_temp_dir().

<?php

// Where the tmp is : 
file_put_contents(sys_get_temp_dir().'/tempFile.txt', $content);


// Avoid hard-coding tmp folder : 
// On Linux-like systems
file_put_contents('/tmp/tempFile.txt', $content);

// On Windows systems
file_put_contents('C:\WINDOWS\TEMP\tempFile.txt', $content);

?>
