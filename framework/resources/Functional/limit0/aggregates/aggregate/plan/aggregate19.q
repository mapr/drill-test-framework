explain plan for select * from ( select count(*) from data where cast(c_row as int) < -1 ) t limit 0;
