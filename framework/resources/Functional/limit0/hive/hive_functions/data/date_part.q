select date_part('year',create_date), date_part('month',create_date),date_part('day', create_date) from voter_parquet where voter_id=10;
