explain plan for select * from ( select name || '_B',registration || '_D' from voter_parquet_v where voter_id=10 ) t limit 0;
