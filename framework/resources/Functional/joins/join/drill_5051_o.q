select count(1) from (select col_int from typeall_l LIMIT 32 OFFSET 16) subqry;
