explain plan for select * from ( select distinct(contributions) from voter_parquet_v where registration <> 'independent' ) t limit 0;
