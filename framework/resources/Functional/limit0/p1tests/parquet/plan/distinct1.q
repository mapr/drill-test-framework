explain plan for select * from ( select distinct(voter_id) from voter_parquet_v where registration <> 'independent' ) t limit 0;
