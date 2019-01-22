select split(n_comment, ' ') [3] col
from cp.`tpch/nation.parquet`
where n_nationkey = 1
group by n_comment
having count(n_name) = 2
order by n_comment
limit 5;