explain plan for select * from ( select to_date(create_timestamp) from voter_parquet where voter_id=10 ) t limit 0;
