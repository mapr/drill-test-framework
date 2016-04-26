explain plan for select * from ( select * from (select col_boln from `prqUnAll_0_v` union all select col_boln from `prqUnAll_1_v`) tmp where tmp.col_boln in (false) limit 20 ) t limit 0;
