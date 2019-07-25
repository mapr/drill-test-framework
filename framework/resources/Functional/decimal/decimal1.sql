select cast('123456789' as decimal(9,0)) / cast('1234567890123456789.1234567890123456789' as decimal(38,5)) from data limit 1;
