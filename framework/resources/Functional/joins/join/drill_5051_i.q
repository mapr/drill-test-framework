select count(*) from (select * from (select * from typeall_l order by col_int LIMIT 3 offset 2 ROWS) t1 limit 2 offset 1) t2;
