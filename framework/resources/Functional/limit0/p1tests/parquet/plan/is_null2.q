explain plan for select * from ( select voter_id from voter_parquet_v where voter_id is null limit 5 ) t limit 0;
