explain plan for select * from ( select contributions from voter_parquet_v where contributions is not null limit 5 ) t limit 0;
