ALTER SESSION SET `exec.sort.disable_managed` = false;
alter session set `planner.memory.max_query_memory_per_node` = 4524288000;
select count(*) from (
  select * from (
    select s1.type type, flatten(s1.rms.rptd) rptds, s1.rms, s1.uid 
    from (
      select d.type type, d.uid uid, flatten(d.map.rm) rms from dfs.`/drill/testdata/resource-manager/nested_large` d order by d.uid
    ) s1
  ) s2
  order by s2.rms.mapid, s2.rptds.a, s2.rptds.do_not_exist
);
ALTER SESSION SET `exec.sort.disable_managed` = true;
alter session set `planner.memory.max_query_memory_per_node` = 2147483648;
