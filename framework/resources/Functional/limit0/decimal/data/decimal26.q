select cast('999999999999999999' as decimal(18,0)) / cast('-0.000000000000000000000000001' as decimal(28,28)) from data limit 1;
