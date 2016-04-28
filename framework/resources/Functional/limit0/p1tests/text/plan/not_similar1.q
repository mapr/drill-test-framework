explain plan for select * from ( select voter_id,name,age,registration,contributions,voterzone,create_time,isVote from voter_csv_v where name not similar to '%(young|u|a)%' ) t limit 0;
