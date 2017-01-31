alter session set `planner.store.parquet.rowgroup.filter.pushdown` = false;
-- should keep partitions 2 and 3.  count is 2.  But it reads all the partitions because filter pushdown has been disabled.
explain plan for select count(*) from orders_parts where float_id >= 3060 and float_id < 3062;
alter session set `planner.store.parquet.rowgroup.filter.pushdown` = true;
