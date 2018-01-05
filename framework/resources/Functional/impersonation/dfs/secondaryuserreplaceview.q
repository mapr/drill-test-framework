use dfs_test.drillTestDirImpersonation;
create or replace view datav(c1, c2, c3) as select c_row, c_int, c_date from data;
create or replace view datav(c1, c2, c3, c4) as select c_row, c_int, c_float4, c_date from data;
select c1, c2, c3, c4 from datav;
select 1 from sys.version;
select 1 from sys.version;
use dfs_test.drillTestDirImpersonation;
