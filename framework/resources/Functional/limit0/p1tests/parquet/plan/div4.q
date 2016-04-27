explain plan for select * from ( select div(cast (contributions as int),age) div from voter_parquet_v where name like '%van%' ) t limit 0;
