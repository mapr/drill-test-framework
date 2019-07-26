select cast('12345.6789' as decimal(9,4)) / cast('12345678901234.56789123456789' as decimal(28,14)) from data limit 1;
