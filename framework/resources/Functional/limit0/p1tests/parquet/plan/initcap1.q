explain plan for select * from ( select initcap(name),initcap(registration) from voter_parquet_v where voter_id < 10 ) t limit 0;
