select * from (select col_int from typeall_l ORDER BY col_int LIMIT 64 OFFSET 32) subqry LIMIT 8 OFFSET 16;
