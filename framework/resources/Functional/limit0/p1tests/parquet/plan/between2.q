explain plan for select * from ( select voter_id,name,age,registration,contributions,voterzone,create_time,isVote from voter_parquet_v where age not between 20 and 70 ) t limit 0;
