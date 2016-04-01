select position('pub' in registration) from voter_parquet_v where registration like '%pub%';
