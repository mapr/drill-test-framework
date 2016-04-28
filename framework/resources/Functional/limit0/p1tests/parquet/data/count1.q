select count(voter_id), count(name), count(age), count(registration), count(contributions), count(voterzone), count(create_time),count(isVote) from voter_parquet_v where name like '%van%';
