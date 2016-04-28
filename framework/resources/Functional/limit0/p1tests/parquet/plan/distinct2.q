explain plan for select * from ( select distinct(name) from voter_parquet_v where registration <> 'independent' ) t limit 0;
