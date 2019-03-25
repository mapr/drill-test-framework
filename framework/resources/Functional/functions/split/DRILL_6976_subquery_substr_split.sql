select substr(col, 2, 3)
from (select split(n_comment, ' ') [3] col
      from cp.`tpch/nation.parquet`
      where n_nationkey = -1
      group by n_comment
      order by n_comment
      limit 5);