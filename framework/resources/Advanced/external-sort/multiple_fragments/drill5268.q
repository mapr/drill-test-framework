ALTER SESSION SET `exec.sort.disable_managed` = false;
alter session set `planner.memory.max_query_memory_per_node` = 1024288000;
select count(*) from (select d1.type, d1.evnt, d1.transaction from (select d.type type, flatten(d.events) evnt, flatten(d.transactions) transaction from dfs.`/drill/testdata/resource-manager/100000rows/data.json` d) d1 order by d1.evnt.event_time, d1.transaction.trans_time) d2 where d2.type='web' and d2.evnt.type = 'cmpgn4';
alter session set `planner.memory.max_query_memory_per_node` = 2147483648;
ALTER SESSION SET `exec.sort.disable_managed` = true;
