Optimize your ``echo``'s by not concatenating at ``echo`` time, but serving all argument separated. This will save PHP a memory copy.

If values, literals and variables, are small enough, this won't have visible impact. Otherwise, this is less work and less memory waste.

<?php
  echo $a, ' b ', $c;
?>

instead of

<?php
  echo  $a . ' b ' . $c;
  echo $a b $c;
?>

