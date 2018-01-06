alter session set `store.format` = 'parquet';
use dfs_test.drillTestDirImpersonation;
create or replace view user1datanoaccessv1(c1, c2, c3, c4) as select c_row, c_int, c_float4, c_date from data;
create or replace view user1datanoaccessv2(c1, c4) as select c1, c4 from user1datanoaccessv1;
create or replace view user1datanoaccessb1(c1, c2, c3, c4) as select c_row, c_int, c_float4, c_date from data;
create or replace view user1datanoaccessb2(c2, c3) as select c2, c3 from user1datanoaccessb1;
