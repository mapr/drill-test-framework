explain plan for select * from ( ( SELECT col_bgint, col_int FROM `prqUnAll_0_v` WHERE 1=0 ) UNION ALL ( SELECT col_bgint, col_int FROM `prqUnAll_1_v` ORDER BY col_int LIMIT 20 ) ) t limit 0;
