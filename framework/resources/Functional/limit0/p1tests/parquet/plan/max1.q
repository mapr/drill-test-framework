explain plan for select * from ( select max(voter_id),max(name),max(registration),max(contributions),max(voterzone),max(create_time) from voter_parquet_v ) t limit 0;
