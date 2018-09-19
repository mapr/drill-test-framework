drop table if exists `dfs.drillTestDir`.t1;
create table `dfs.drillTestDir`.t1 as select 1 as c1;
drop table if exists dfs.drillTestDir.t2;
create table dfs.drillTestDir.t2 as select 1 as c2;
drop table if exists dfs.drillTestDir.`t3`;
create table dfs.drillTestDir.`t3` as select 1 as c2,1 as c1;
--@test
select a.c2 from dfs.drillTestDir.`t2` a
join  dfs.drillTestDir.`t3` b ON b.c2 = a.c2
join `dfs.drillTestDir`.t1 c ON b.c1 = c.c1;
