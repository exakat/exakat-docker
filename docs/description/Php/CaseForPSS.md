The special parent, static and self keywords needed to be lowercase to be useable. This was fixed in PHP 5.5; otherwise, they would yield a 'PHP Fatal error:  Class 'PARENT' not found'.

parent, static and self are traditionally written in lowercase only. Mixed case and Upper case are both valid, though.

<?php

class foo {
    const aConstante = 233;
    
    function method() {
        // Wrong case, error with PHP 5.4.* and older
        echo SELF::aConstante;
        
        // Always right. 
        echo self::aConstante;
    }
}

?>

Until PHP 5.5, non-lowercase version of those keywords are generating a bug. 
