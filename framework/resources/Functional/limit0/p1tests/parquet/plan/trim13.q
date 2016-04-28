explain plan for select * from ( select trim(trailing name),trim(trailing registration) from voter_parquet_v where voter_id=20 ) t limit 0;
