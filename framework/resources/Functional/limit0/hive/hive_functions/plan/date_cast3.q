explain plan for select * from ( select cast(create_timestamp as date) create_date from voter_parquet limit 10 ) t limit 0;
