select voter_id, create_date, registration from voter_parquet where create_date <= '2017-01-15' and create_date >= '2016-09-25' order by create_date;
