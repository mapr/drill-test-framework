WITH t1 AS(select contributions, min(contributions)  over(partition by registration) as total from voter_hive) select distinct contributions as contribution, total from t1 order by contribution;
