select max(s.price_sum) from (select sum(l_extendedprice) price_sum from dfs.concurrency.lineitem group by l_orderkey) s;
