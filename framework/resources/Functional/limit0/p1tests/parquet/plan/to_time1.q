explain plan for select * from ( select to_time(create_time, 'YYYY-MM-dd hh:mm:ss.SSS') from voter_parquet_v where voter_id=10 ) t limit 0;
