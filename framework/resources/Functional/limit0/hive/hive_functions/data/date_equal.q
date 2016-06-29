select sum(contributions), count(registration) from voter_parquet where create_date = '2016-04-20';
