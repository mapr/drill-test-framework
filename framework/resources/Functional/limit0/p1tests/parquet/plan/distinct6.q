explain plan for select * from ( select distinct(create_time) from voter_parquet_v where registration <> 'independent' ) t limit 0;
