select cast('-0.00000000000000001' as decimal(18,18)) + cast('0.000000000000000000000000001' as decimal(28,28)) from data limit 1;
