alter session set planner.enable_hashjoin = false;
alter session set planner.enable_mergejoin = false;
alter session set planner.enable_nljoin_for_scalar_only = false;
alter session set planner.enable_join_optimization = false;
--@test
select c.custID, c.firstname, o.orderID, o.totalCost from dfs.`/drill/testdata/joins/MD-3686/customer` c, dfs.`/drill/testdata/joins/MD-3686/order` o where c.custID = o.custID;
alter session set planner.enable_hashjoin = true;
alter session set planner.enable_mergejoin = true;
alter session set planner.enable_nljoin_for_scalar_only = true;
alter session set planner.enable_join_optimization = true;
