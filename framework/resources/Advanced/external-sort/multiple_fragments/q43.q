ALTER SESSION SET `exec.sort.disable_managed` = false;
alter session set `planner.memory.max_query_memory_per_node` = 3524288000;
create view dfs.drillTestDir.`resource-manager/v1_ext_multiple` as select uid, flatten(events) event from dfs.`/drill/testdata/resource-manager/nested-large.json` d limit 10000;
create view dfs.drillTestDir.`resource-manager/v2_ext_multiple` as select uid, flatten(transactions) transaction from dfs.`/drill/testdata/resource-manager/nested-large.json` d;
select count(*) from (select * from (select v1_ext_multiple.uid, MAX(v2_ext_multiple.transaction.amount), MIN(v1_ext_multiple.event.event_time) from dfs.drillTestDir.`resource-manager/v1_ext_multiple` v1_ext_multiple inner join dfs.drillTestDir.`resource-manager/v2_ext_multiple` v2_ext_multiple on v1_ext_multiple.uid = v2_ext_multiple.uid where v2_ext_multiple.transaction.trans_time < 8888888 and v1_ext_multiple.event.event_time=1000000 group by v1_ext_multiple.uid order by v1_ext_multiple.uid
  ) d 
) d1 where d1.uid = -101;
drop view dfs.drillTestDir.`resource-manager/v1_ext_multiple`;
drop view dfs.drillTestDir.`resource-manager/v2_ext_multiple`;
ALTER SESSION SET `exec.sort.disable_managed` = true;
alter session set `planner.memory.max_query_memory_per_node` = 2147483648;
