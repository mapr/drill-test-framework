-- drill-3591 : partition pruning hit AssertionError when a cast function is used in comparison operand
select 
	count(*)
from
	`/drill/testdata/partition_pruning/dfs/orders`	
where
	dir0 = substring('*****1995*****', 6, 4) and o_custkey >= 100;
