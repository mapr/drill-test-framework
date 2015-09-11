select ps.ps_partkey, count(*) 
  from lineitem l, 
          partsupp ps 
  where l.l_partkey = ps.ps_partkey 
group by ps.ps_partkey;
