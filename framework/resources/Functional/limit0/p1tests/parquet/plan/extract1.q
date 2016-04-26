explain plan for select * from ( select extract(day from (create_time)) from voter_parquet_v where voter_id=10 ) t limit 0;
