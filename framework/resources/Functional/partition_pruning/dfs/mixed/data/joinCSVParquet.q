select o.O_TOTALPRICE, l.columns[0]
   from `/drill/testdata/partition_pruning/dfs/orders` o, `/drill/testdata/partition_pruning/dfs/lineitem` l
   where o.O_ORDERKEY = cast(l.columns[0] as integer) and o.O_TOTALPRICE > 300000.00
   order by o.O_TOTALPRICE;
