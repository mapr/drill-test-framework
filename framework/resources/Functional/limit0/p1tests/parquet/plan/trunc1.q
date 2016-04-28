explain plan for select * from ( select trunc(voter_id,2),trunc(age,1),trunc(contributions,1),trunc(voterzone,3) from voter_parquet_v where voter_id=150 ) t limit 0;
