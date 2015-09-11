select cast('123456789' as decimal(9,0)) / cast('12345678901234.56789123456789' as decimal(28,14)) from data limit 1;
