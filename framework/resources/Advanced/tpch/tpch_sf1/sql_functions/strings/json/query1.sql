select max(cast(concat(substr(cast(L_EXTENDEDPRICE as varchar(5)),2,5),'0') as double)) from lineitem group by L_EXTENDEDPRICE order by L_EXTENDEDPRICE desc limit 5;
