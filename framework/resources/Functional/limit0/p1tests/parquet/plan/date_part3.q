explain plan for select * from ( select date_part('second',create_time) from voter_parquet_v where voter_id=10 ) t limit 0;
