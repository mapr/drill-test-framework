select cast('-0.00000001' as decimal(9,9)) / cast('-9999999999999999999999999999' as decimal(28,0)) from data limit 1;
