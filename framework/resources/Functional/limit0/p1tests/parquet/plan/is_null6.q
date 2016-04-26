explain plan for select * from ( select create_time from voter_parquet_v where create_time is null limit 5 ) t limit 0;
