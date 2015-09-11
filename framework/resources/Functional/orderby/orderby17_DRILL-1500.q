select n_nationkey, n_name, n_regionkey, n_comment from cp.`tpch/nation.parquet` where n_nationkey < 2 order by n_regionkey;
