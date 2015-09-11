select c_custkey, c_nationkey from customer c where c_acctbal between 1000 and 1200 and c_nationkey in (2, 5);
