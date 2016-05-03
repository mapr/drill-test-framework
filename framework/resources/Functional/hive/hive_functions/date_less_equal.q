select voter_id, create_date, registration from voter_parquet where create_date <= '2016-06-25' order by create_date;
