explain plan for select * from ( select cast(c_row as int), cast(c_time as time) from basic where c_time < '00:00' ) t limit 0;
