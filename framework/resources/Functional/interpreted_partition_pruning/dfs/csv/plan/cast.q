explain plan for
select 
	count(*)
from
	`/drill/testdata/partition_pruning/dfs/orders`	
where
	dir0 = cast(1994 as varchar(10)) and o_custkey >= 100;
