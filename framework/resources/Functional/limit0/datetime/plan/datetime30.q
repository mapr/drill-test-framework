explain plan for select * from ( select cast(c_row as integer), extract(hour from cast(c_timestamp as timestamp)) from basic ) t limit 0;
