explain plan for select * from ( select (voter_id/100),(age/20),(contributions/20) from voter_parquet_v where voter_id=10 ) t limit 0;
