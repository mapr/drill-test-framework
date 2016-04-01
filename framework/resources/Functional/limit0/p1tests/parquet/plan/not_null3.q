explain plan for select * from ( select age from voter_parquet_v where age is not null limit 5 ) t limit 0;
