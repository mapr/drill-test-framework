explain plan for select * from ( select registration from voter_parquet_v where registration is null limit 5 ) t limit 0;
