explain plan for select * from ( select cast(c_row as int), cast(c_date as date) from basic where c_date < '2000-01-01' ) t limit 0;
