explain plan for select * from ( select distinct(isVote) from voter_parquet_v where registration <> 'independent' ) t limit 0;
