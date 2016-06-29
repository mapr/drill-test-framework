select cast('123456789.123456789' as decimal(18,9)) / cast('12345678901234.56789123456789' as decimal(28,14)) from data limit 1;
