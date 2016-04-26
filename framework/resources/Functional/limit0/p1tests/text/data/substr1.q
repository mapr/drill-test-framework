select substr(name, 3, 5),substr(registration,3,5),substr(contributions,2,2),substr(voterzone,1,3),substr(create_time,1,10),substr(isVote,2,3) from voter_csv_v where voter_id=10;
