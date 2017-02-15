ALTER SESSION SET `exec.sort.disable_managed` = false;
alter session set `planner.width.max_per_node` = 1;
alter session set `planner.disable_exchanges` = true;
alter session set `planner.width.max_per_query` = 1;
alter session set `planner.memory.max_query_memory_per_node` = 252428800;
select count(*) from (
  select * from (
    select s1.type type, flatten(s1.rms.rptd) rptds, s1.rms, s1.uid 
    from (
      select d.type type, d.uid uid, flatten(d.map.rm) rms from dfs.`/drill/testdata/resource-manager/nested-large.json` d order by d.uid
    ) s1
  ) s2
  order by s2.rms.mapid, s2.rptds.a, s2.rptds.do_not_exist
);
ALTER SESSION SET `exec.sort.disable_managed` = true;
alter session set `planner.width.max_per_node` = 17;
alter session set `planner.disable_exchanges` = false;
alter session set `planner.width.max_per_query` = 1000;
alter session set `planner.memory.max_query_memory_per_node` = 2147483648;
