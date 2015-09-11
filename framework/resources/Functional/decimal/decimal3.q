select cast('-999999999' as decimal(9,0)) / cast('-0.000000000000000000000000001' as decimal(28,28)) from data limit 1;
