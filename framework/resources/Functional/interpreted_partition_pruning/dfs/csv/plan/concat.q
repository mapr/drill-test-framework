explain plan for
select 
	count(*)
from
	`/drill/testdata/partition_pruning/dfs/orders`	
where
	dir0 = concat('19','94') and o_custkey is not null;
