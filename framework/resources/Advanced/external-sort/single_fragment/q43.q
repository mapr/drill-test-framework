ALTER SESSION SET `exec.sort.disable_managed` = false;
alter session set `planner.width.max_per_node` = 1;
alter session set `planner.disable_exchanges` = true;
alter session set `planner.width.max_per_query` = 1;
alter session set `planner.memory.max_query_memory_per_node` = 152428800;
create view dfs.drillTestDir.`resource-manager/v1_ext` as select uid, flatten(events) event from dfs.`/drill/testdata/resource-manager/nested-large.json` d limit 10000;
create view dfs.drillTestDir.`resource-manager/v2_ext` as select uid, flatten(transactions) transaction from dfs.`/drill/testdata/resource-manager/nested-large.json` d;
select count(*) from (select * from (select v1_ext.uid, MAX(v2_ext.transaction.amount), MIN(v1_ext.event.event_time) from dfs.drillTestDir.`resource-manager/v1_ext` v1_ext inner join dfs.drillTestDir.`resource-manager/v2_ext` v2_ext on v1_ext.uid = v2_ext.uid where v2_ext.transaction.trans_time < 8888888 and v1_ext.event.event_time=1000000 group by v1_ext.uid order by v1_ext.uid
  ) d 
) d1 where d1.uid = -101;
drop view dfs.drillTestDir.`resource-manager/v1_ext`;
drop view dfs.drillTestDir.`resource-manager/v2_ext`;
ALTER SESSION SET `exec.sort.disable_managed` = true;
alter session set `planner.width.max_per_node` = 17;
alter session set `planner.disable_exchanges` = false;
alter session set `planner.width.max_per_query` = 1000;
alter session set `planner.memory.max_query_memory_per_node` = 2147483648;
