explain plan for select * from ( select cast(c_row as int), cast(c_date as date), date_add(cast(c_date as date), 15) from basic ) t limit 0;
