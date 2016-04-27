explain plan for select * from ( select isVote from voter_parquet_v where isVote is not null limit 5 ) t limit 0;
