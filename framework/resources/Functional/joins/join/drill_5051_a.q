select count(1) from (select col_int from (select col_int from typeall_l LIMIT 2) t1 limit 1 offset 1) t2;
