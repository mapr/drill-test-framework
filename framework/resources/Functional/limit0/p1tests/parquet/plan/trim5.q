explain plan for select * from ( select trim(leading 'i' from name),trim(leading 'r' from registration) from voter_parquet_v where voter_id=46 ) t limit 0;
