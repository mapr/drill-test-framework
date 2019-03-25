select coalesce(col, n_name)
from (select split(n_comment, ' ') [3] col, n_name
      from cp.`tpch/nation.parquet`
      where n_nationkey = -1
      limit 5);