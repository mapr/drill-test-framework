create or replace view `dfs.union`.union_01_v as select cast(c1 as int) c1,cast(c2 as bigint) c2,cast(c3 as char(2)) c3,cast(c4 as varchar(52)) c4,cast(c5 as timestamp) c5,cast(c6 as date) c6,cast(c7 as boolean) c7,cast(c8 as double) c8, cast(c9 as time) c9 from `dfs.union`.`union_01.parquet`;

create or replace view `dfs.union`.union_02_v as select cast(c1 as int) c1,cast(c2 as bigint) c2,cast(c3 as char(2)) c3,cast(c4 as varchar(52)) c4,cast(c5 as timestamp) c5,cast(c6 as date) c6,cast(c7 as boolean) c7,cast(c8 as double) c8, cast(c9 as time) c9 from `dfs.union`.`union_02.parquet`;
