explain plan for select * from ( select lower(name),lower(registration) from voter_parquet_v where voter_id=15 ) t limit 0;
