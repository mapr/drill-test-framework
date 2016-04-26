explain plan for select * from ( select upper(name),upper(registration) from voter_parquet_v where voter_id=10 ) t limit 0;
