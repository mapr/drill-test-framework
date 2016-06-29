explain plan for select * from ( select cast(create_date as varchar(10)) create_date from voter_parquet order by create_date limit 10 ) t limit 0;
