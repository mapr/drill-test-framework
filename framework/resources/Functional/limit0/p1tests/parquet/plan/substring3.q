explain plan for select * from ( select substring(name,3),substring(registration,5) from voter_parquet_v where voter_id=10 ) t limit 0;
