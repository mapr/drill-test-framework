explain plan for select * from ( select months_between(create_date, cast(create_timestamp as date)) from voter_parquet where voter_id=10 ) t limit 0;
