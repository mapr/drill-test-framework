select (voter_id -3),(age - voter_id),(contributions - 10),(voterzone - 1000) from voter_parquet_v where voter_id=10;
