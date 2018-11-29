set `planner.enable_nljoin_for_scalar_only` = false;
select c.c_custkey,o.o_orderstatus from (select distinct(o_orderstatus) from orders) o cross join customer c order by c.c_custkey,o.o_orderstatus limit 10;
reset `planner.enable_nljoin_for_scalar_only`;
