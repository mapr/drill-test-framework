explain plan for select * from ( select voter_id, cast(create_timestamp as date) create_date from voter_parquet order by voter_id limit 10 ) t limit 0;
