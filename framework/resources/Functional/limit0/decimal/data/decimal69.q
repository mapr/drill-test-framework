select cast('123456789.123456789' as decimal(18,9)) + cast('0.000000000000000000000000001' as decimal(28,28)) from data limit 1;
