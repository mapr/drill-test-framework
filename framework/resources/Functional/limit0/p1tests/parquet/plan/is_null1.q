explain plan for select * from ( select name from voter_parquet_v where name is null limit 5 ) t limit 0;
