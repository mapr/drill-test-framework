explain plan for select * from ( select cast(c_row as integer), extract(Month from cast(c_date as date)) from basic ) t limit 0;
