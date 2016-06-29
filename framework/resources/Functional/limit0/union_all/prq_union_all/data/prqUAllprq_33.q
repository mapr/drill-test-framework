select count(*) from (select col_date from `prqUnAll_0_v` union all select col_date from `prqUnAll_1_v` ) tmp;
