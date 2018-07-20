Modern databases provides support for prepared statement : it separates the query from the processed data and highten significantly the security. 

Building queries with concatenations is not recommended, though not always avoidable. When possible, use prepared statements.

<?php
/* Execute a prepared statement by passing an array of values */

$sql = 'SELECT name, colour, calories
    FROM fruit
    WHERE calories < :calories AND colour = :colour';
$sth = $conn->prepare($sql, array(PDO::ATTR_CURSOR => PDO::CURSOR_FWDONLY));
$sth->execute(array(':calories' => 150, ':colour' => 'red'));
$red = $sth->fetchAll();
?>

Same code, without preparation : 

<?php

    $sql = 'SELECT name, color, calories FROM fruit WHERE calories < '.$conn-quote(150).' AND colour = '.$conn->quotes('red').' ORDER BY name';
    $sth = $conn->query($sql) as $row);
}
?>
