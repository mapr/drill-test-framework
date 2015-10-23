-- drill-3591 : partition pruning hit AssertionError when a cast function is used in comparison operand
-- negative test : everything should be scanned
select 
	count(*)
from
	`/drill/testdata/partition_pruning/dfs/orders`	
where
	dir0 = coalesce(o_orderdate, '1993') and o_custkey >= 100;
