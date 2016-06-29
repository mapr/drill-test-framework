explain plan for select * from ( select cast(c_date as date), date_add(cast(c_date as date),-1) from basic ) t limit 0;
