select cast('123456789.123456789' as decimal(18,9)) / cast('-9999999999999999999999999999999999999' as decimal(38,0)) from data limit 1;
