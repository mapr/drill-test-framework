select count(*) FROM (select * from typeall_l ORDER BY col_int LIMIT 105 OFFSET 16) subqry;
