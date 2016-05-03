explain plan for select * from ( select months_between(cast(create_timestamp as date), create_date) from voter_parquet where voter_id=10 ) t limit 0;
