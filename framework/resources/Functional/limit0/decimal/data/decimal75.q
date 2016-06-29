select cast('-0.00000001' as decimal(9,9)) / cast('-0.000000000000000000000000001' as decimal(28,28)) from data limit 1;
