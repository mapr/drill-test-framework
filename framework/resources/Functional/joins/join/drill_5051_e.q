select count(col_int) from (select * from (select * from typeall_l LIMIT 2) t1 limit 1 offset 1) t2;
