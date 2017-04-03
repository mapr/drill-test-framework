select count(*) from (select * from (select * from typeall_l order by col_int LIMIT 3) t1 limit 2 offset 1) t2;
