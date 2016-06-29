explain plan for select * from ( select extract(year from create_date),extract(month from create_date),extract(day from create_date) from voter_parquet where voter_id=10 ) t limit 0;
