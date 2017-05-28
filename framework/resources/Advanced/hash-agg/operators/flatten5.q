-- 1st Agg : 4 out of 4 partitions spilled and spill cycle is 2
-- 2nd Agg : 2 out of 2 partitions spilled and spill cycle is 4
alter session set `planner.width.max_per_node` = 2;
alter session set `planner.width.max_per_query` = 2;
alter session set `planner.memory.max_query_memory_per_node` = 554857600;
select count(*) from (select max(s3.uid_rnd1), max(s3.rptd.a) from (select uid_rnd1, uid_rnd2_max, a_max, flatten(convert_from(rptds, 'JSON')) rptd  from (select s1.uid_rnd1 uid_rnd1, max(s1.uid_rnd2) uid_rnd2_max, max(s1.rms.rptd[0].a) a_max, max(convert_to(s1.rms.rptd, 'JSON')) rptds from (select uid_rnd1, uid_rnd2, d.type type, d.uid uid, flatten(d.map.rm) rms from dfs.`/drill/testdata/hash-agg/nested_large_rand` d) s1 group by s1.uid_rnd1) s2) s3 group by uid_rnd2_max) s4;
alter session set `planner.memory.max_query_memory_per_node` = 2147483648;
alter session set `planner.width.max_per_node` = 17;
alter session set `planner.width.max_per_query` = 1000;
