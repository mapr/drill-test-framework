-- drill-3591 : partition pruning hit AssertionError when a cast function is used in comparison operand
select 
	count(*)
from
	`/drill/testdata/partition_pruning/dfs/orders`	
where
	dir0 <> 1000 + 994 and o_custkey is not null;
