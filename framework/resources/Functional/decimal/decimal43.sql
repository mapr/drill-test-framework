select cast('-0.00000000000000001' as decimal(18,18)) + cast('12345678901234.56789123456789' as decimal(28,14)) from data limit 1;
