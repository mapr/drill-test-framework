select count(1) from (select * from (select * from typeall_l order by col_int LIMIT 3 offset 2) t1 limit 2 ) t2;
