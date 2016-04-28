explain plan for select * from ( select voter_id,name,age,registration,contributions,voterzone,create_time,isVote from voter_csv_v where age not between 20 and 70 ) t limit 0;
