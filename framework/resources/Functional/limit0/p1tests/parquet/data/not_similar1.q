select voter_id,name,age,registration,contributions,voterzone,create_time,isVote from voter_parquet_v where name not similar to '%(young|u|a)%';
