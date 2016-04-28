explain plan for select * from ( select cast(c_row as int), date_part('year', cast(c_timestamp as timestamp)) from basic ) t limit 0;
