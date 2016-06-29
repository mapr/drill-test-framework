select sum(contributions) as col1, count(create_date) as col2, create_date from voter_parquet where create_date < '2016-06-01' group by create_date order by create_date;
