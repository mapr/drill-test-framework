explain plan for select * from ( select trim(leading name),trim(leading registration) from voter_parquet_v where voter_id=20 ) t limit 0;
