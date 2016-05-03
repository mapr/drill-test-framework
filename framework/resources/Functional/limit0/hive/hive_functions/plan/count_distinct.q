explain plan for select * from ( select count(distinct(create_date)) from voter_parquet where create_date > '2016-06-01' ) t limit 0;
