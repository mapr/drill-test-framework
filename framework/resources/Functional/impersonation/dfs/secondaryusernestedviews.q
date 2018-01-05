alter session set `store.format` = 'json';
use dfs_test.drillTestDirImpersonation;
create or replace view user1datav4(c1, c2, c3, c4) as select c_row, c_int, c_float4, c_date from data;
create or replace view user1datav3(c1, c2, c3) as select c1, c2, c3 from user1datav4;
create or replace view user1datav2(c1, c2) as select c1, c2 from user1datav3;
create or replace view user1datav1(c1) as select c1 from user1datav2;
select * from user1datav1;
select 1 from sys.version;
select 1 from sys.version;
select 1 from sys.version;
select 1 from sys.version;
use dfs_test.drillTestDirImpersonation;
alter session set `store.format` = 'parquet';

