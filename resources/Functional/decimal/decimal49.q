select cast('999999999' as decimal(9,0)) + cast('0.0000000000000000000000000000000000001' as decimal(38,38)) from data limit 1;
