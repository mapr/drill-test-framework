explain plan for select * from ( ( SELECT col_bgint, col_int FROM `prqUnAll_0_v` ORDER BY col_int limit 20 ) UNION ALL ( SELECT col_bgint, col_int FROM `prqUnAll_1_v` WHERE 1=0 ) ) t limit 0;
