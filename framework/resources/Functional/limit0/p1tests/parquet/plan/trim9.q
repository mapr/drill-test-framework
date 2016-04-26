explain plan for select * from ( select trim(name),trim(registration) from voter_parquet_v where voter_id=20 ) t limit 0;
