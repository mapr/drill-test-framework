explain plan for select * from ( select to_char(voter_id,'00.0'),to_char(age,'#%'),to_char(contributions,'000'),to_char(voterzone,'#.##E00'),to_char(create_time, 'MM-dd-YYYY') from voter_parquet_v where voter_id=10 ) t limit 0;
