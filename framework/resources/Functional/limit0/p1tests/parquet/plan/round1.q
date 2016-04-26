explain plan for select * from ( select round(contributions,1) from voter_parquet_v where voter_id=1 ) t limit 0;
