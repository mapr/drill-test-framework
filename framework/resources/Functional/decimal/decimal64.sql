select cast('12345.6789' as decimal(9,4)) / cast('9999999999999999999999999999999999999' as decimal(38,0)) from data limit 1;
