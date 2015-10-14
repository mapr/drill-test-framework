alter session set `planner.slice_target` = 1;
select * from lineitem l left outer join orders o on (l.l_orderkey = o.o_orderkey) left outer join  customer c on (l.l_orderkey = c.c_custkey) left outer join  nation n on (l.l_partkey = n.n_nationkey) left outer join  region r  on (l.l_suppkey = r.r_regionkey);
alter session set `planner.slice_target` = 100000;
