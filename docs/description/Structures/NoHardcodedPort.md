When connecting to a remove server, port is an important information. It is recommended to make this configurable (with constant or configuration), to as to be able to change this value without changing the code.

<?php

    // Both configurable IP and hostname
    $connection = ssh2_connect($_ENV['SSH_HOST'], $_ENV['SSH_PORT'], $methods, $callbacks);
    
    // Both hardcoded IP and hostname
    $connection = ssh2_connect('shell.example.com', 22, $methods, $callbacks);

    if (!$connection) die('Connection failed');
?>

