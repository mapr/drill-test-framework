select round(L_EXTENDEDPRICE) from lineitem group by L_EXTENDEDPRICE order by L_EXTENDEDPRICE desc limit 5;
