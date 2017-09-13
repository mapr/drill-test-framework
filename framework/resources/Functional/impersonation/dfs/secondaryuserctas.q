alter session set `store.format` = 'json';
use dfs_test.drillTestDirImpersonation;
create table user1data(c1, c2, c3, c4) as select c_row, c_int, c_float4, c_date from data;
select count(*) from user1data;
drop table user1data;
use dfs_test.drillTestDirImpersonation;
alter session set `store.format` = 'parquet';

