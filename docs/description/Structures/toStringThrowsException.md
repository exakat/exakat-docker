Magical method __toString() can't throw exceptions.

In fact, __toString() may not let an exception pass. If it throw an exception, but must catch it. If an underlying method throws an exception, it must be caught.

<?php

class myString {
    private $string = null;
    
    public function __construct($string) {
        $this->string = $string;
    }
    
    public function __toString() {
        // Do not throw exceptions in __toString
        if (!is_string($this->string)) {
            throw new Exception('$this->string is not a string!!');
        }
        
        return $this->string;
    }
}   

?>

A fatal error is displayed, when an exception is not intercepted in the __toString() function. 

::

    PHP Fatal error:  Method myString::__toString() must not throw an exception, caught Exception: 'Exception message' in ``file.php``

See also [__toString()](http://php.net/manual/en/language.oop5.magic.php#object.tostring).
