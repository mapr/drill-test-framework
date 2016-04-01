explain plan for select * from ( select min(col_date) from (select col_date from `prqUnAll_0_v` union all select col_date from `prqUnAll_1_v` ) tmp ) t limit 0;
