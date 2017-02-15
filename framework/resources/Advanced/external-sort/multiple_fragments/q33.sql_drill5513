ALTER SESSION SET `exec.sort.disable_managed` = false;
alter session set `planner.width.max_per_query` = 100;
alter session set `planner.memory.max_query_memory_per_node` = 652428800;
select count(*) from (select s1.type type, flatten(s1.rms.rptd) rptds from (select d.type type, d.uid uid, flatten(d.map.rm) rms from dfs.`/drill/testdata/resource-manager/nested-large.json` d order by d.uid) s1 order by s1.rms.mapid);
ALTER SESSION SET `exec.sort.disable_managed` = true;
alter session set `planner.width.max_per_query` = 1000;
alter session set `planner.memory.max_query_memory_per_node` = 2147483648;
