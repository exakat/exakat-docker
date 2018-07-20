Preprocessing values is the preparation of values before PHP executes the code. 

There is no macro language in PHP, that prepares the code before compilation, bringing some comfort and short syntax. Most of the time, one uses PHP itself to preprocess data. 

For example : 

<?php
    $days_en = 'monday,tuesday,wednesday,thursday,friday,saturday,sunday';
    $days_zh = '星期－,星期二,星期三,星期四,星期五,星期六,星期日';

    $days = explode(',', $lang === 'en' ? $days_en : $days_zh); 
?>

could be written 

<?php
    if ($lang === 'en') {
        $days = ['monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday', 'sunday'];
    } else {
        $days = ['星期－', '星期二', '星期三', '星期四', '星期五', '星期六', '星期日'];
    }
?>

and avoid preprocessing the string into an array first. 

Preprocessing could be done anytime the script includes all the needed values to process the expression. 

