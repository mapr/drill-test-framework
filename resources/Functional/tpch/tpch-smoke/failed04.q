select ps.ps_partkey, count(*) from lineitem l, partsupp ps 
  where l.l_partkey = ps.ps_partkey and ps.ps_partkey = 30 group by ps.ps_partkey;
