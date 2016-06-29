select date_add(create_time, interval '-5' DAY) from voter_parquet_v where voter_id=10;
