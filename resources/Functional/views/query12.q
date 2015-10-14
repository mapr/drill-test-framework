create or replace view v12 as select * from `dfs/parquet/rankings`;
create or replace view v12_2 as select * from `dfs/parquet/uservisits`;
select * from v12 inner join v12_2 on v12.pageURL = v12_2.destinationURL;
drop view v12;
drop view v12_2;
