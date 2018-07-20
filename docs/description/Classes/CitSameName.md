The following names are used at the same time for classes, interfaces or traits. For example, 

<?php
    class a { /* some definitions */ }
    interface a { /* some definitions */ }
    trait a { /* some definitions */ }
?>

Even if they are in different namespaces, this makes them easy to confuse. Besides, it is recommended to have markers to differentiate classes from interfaces from traits. 