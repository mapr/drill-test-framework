select * from (select col_int from typeall_l ORDER BY col_int LIMIT 32 OFFSET 16) subqry LIMIT 8 OFFSET 4;
