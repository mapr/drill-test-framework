explain plan for select * from ( select trunc(voter_id,1),trunc(age,2),trunc(contributions,0),trunc(voterzone,1) from voter_parquet_v where voter_id=10 ) t limit 0;
