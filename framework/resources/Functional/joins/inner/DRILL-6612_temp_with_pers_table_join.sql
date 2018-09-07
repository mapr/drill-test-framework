drop table if exists temp_tab;
create TEMPORARY table temp_tab as select '12312' as c2;
drop table if exists dfs.drillTestDir.pers_tab;
create table dfs.drillTestDir.pers_tab as select '12312' as c1;
--@test
select * from dfs.drillTestDir.`pers_tab` a join `temp_tab` b on a.c1 = b.c2;
