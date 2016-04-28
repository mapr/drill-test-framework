explain plan for select * from ( select cast(c_row as int), extract(minute from cast(c_timestamp as timestamp)) from basic ) t limit 0;
