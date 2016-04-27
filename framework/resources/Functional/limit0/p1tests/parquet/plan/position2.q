explain plan for select * from ( select position('il' in name) from voter_parquet_v where name like '%il%' ) t limit 0;
