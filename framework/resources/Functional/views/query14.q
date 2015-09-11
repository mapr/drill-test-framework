create or replace view v14 as select * from `dfs/parquet/rankings`;
create or replace view v14_2 as select * from `dfs/parquet/uservisits`;
select count(*) from v14 inner join v14_2 on v14.pageURL = v14_2.destinationURL;
drop view v14;
drop view v14_2;
