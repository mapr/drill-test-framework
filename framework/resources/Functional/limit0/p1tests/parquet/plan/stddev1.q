explain plan for select * from ( select stddev(voter_id),stddev(age),stddev(contributions),stddev(voterzone) from voter_parquet_v where age > 30 ) t limit 0;
