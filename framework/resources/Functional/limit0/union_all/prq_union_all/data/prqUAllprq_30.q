select count(col_date) count_date, col_boln from `prqUnAll_0_v` group by col_boln union all select count(col_date) count_date, col_boln from `prqUnAll_1_v` group by col_boln;
