select cast('-999999999' as decimal(9,0)) / cast('-9999999999999999999999999999999999999' as decimal(38,0)) from data limit 1;
