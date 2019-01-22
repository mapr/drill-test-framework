select split(n_comment, ' ') [3] col
from cp.`tpch/nation.parquet`
where n_nationkey < 2 and n_nationkey > 2
group by n_comment
order by n_comment
limit 5;