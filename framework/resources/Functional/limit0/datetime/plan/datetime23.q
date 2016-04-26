explain plan for select * from ( select cast(c_row as int), extract(Minute from cast(c_time as time)) from basic ) t limit 0;
