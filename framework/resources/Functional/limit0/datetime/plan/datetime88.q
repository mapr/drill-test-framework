explain plan for select * from ( select cast(c_row as integer), cast(c_time as time) from data where c_time >= '00:00' ) t limit 0;
