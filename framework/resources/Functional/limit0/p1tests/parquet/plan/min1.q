explain plan for select * from ( select min(voter_id),min(name),min(registration),min(contributions),min(voterzone),min(create_time),min(isVote) from voter_parquet_v ) t limit 0;
