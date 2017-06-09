select voter_id, name from `hive1_parquet_part` where date_part('year', create_timestamp1)=2018;
