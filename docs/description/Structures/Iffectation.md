Affectations that appears in a condition. 

Iffectations are a way to do both a test and an affectations. 
They may also be typos, such as if ($x = 3) { ... }, leading to a constant condition. 

<?php

// an iffectation : assignation in a If condition
if($connexion = mysql_connect($host, $user, $pass)) {
    $res = mysql_query($connexion, $query);
}

// Iffectation may happen in while too.
while($row = mysql_fetch($res)) {
    $store[] = $row;
}

?>

