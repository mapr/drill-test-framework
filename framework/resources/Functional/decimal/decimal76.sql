select cast('12345.6789' as decimal(9,4)) / cast('1234567890123456789.1234567890123456789' as decimal(38,19)) from data limit 1;
