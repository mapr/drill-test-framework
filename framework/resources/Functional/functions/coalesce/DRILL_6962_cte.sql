with t as (select coalesce(n_name1, n_name2) c1, c2 from cp.`tpch/nation.parquet`)
select coalesce(c1, c2) from t limit 5;