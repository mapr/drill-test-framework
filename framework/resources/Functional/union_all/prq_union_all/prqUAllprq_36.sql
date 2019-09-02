drop table if exists dfs.union_all.`MyTbl_1`;
drop table if exists dfs.union_all.`MyTbl_2`;
drop view if exists dfs.union_all.`MyView1`;
create table dfs.union_all.MyTbl_1 as (select 1 as Col);
create table dfs.union_all.MyTbl_2 as (select 2 as Col);
use dfs.union_all;
create or replace view dfs.union_all.MyView1 as with `tbl_un` as (select Col from MyTbl_1 union all select Col from MyTbl_2) select * from `tbl_un`;
--@test
select * from dfs.union_all.MyView1;
