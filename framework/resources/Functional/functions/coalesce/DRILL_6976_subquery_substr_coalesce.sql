select substr(col, 2, 3)
from (select coalesce(n_comment, n_name) col
      from cp.`tpch/nation.parquet`
      where n_nationkey = -1
      limit 5);