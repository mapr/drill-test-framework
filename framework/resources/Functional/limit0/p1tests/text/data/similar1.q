select voter_id,name,age,registration,contributions,voterzone,create_time,isVote from voter_csv_v where name similar to '%(young|luke)%';
