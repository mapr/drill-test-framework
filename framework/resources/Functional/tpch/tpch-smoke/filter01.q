select c_custkey, c_nationkey 
  from customer c 
  where c_acctbal between 1000 and 1200 
             and c_nationkey < 10 
             or c_nationkey in (20, 30) 
             and (c_custkey < 500 or c_custkey > 1000) 
order by c_custkey, c_nationkey;
