select cast('12345.6789' as decimal(9,4)) + cast('9999999999999999999999999999' as decimal(28,0)) from data limit 1;
