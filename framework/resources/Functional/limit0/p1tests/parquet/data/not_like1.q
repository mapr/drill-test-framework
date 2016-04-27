select voter_id, name, registration, contributions, voterzone, create_time,isVote from voter_parquet_v where name not like '%a%';
