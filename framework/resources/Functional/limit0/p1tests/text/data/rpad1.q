select rpad(voter_id,3),rpad(name,20,'A'),rpad(age,2),rpad(registration,15,'B'),rpad(contributions,3),rpad(voterzone,3),rpad(create_time,30,'C'),rpad(isVote,8,'D') from voter_csv_v where voter_id=10;
