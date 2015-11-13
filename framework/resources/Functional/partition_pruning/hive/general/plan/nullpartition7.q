explain plan for select * from hive.empty_lengthy_p2 d2, hive.empty_lengthy_p1 d1 where d2.varchar_col = d1.varchar_col and length(d2.varchar_col)>10;
