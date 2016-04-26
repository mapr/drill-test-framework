select cast('0.00000001' as decimal(9,9)) / cast('-0.0000000000000000000000000000000000001' as decimal(38,38)) from data limit 1;
