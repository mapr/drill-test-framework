select mod(voter_id, 3), mod(age, 2), mod(contributions, 11), mod(voterzone, 123) from voter_csv_v where voter_id=10;
