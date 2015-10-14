create or replace view v25 as select * from `dfs/parquet/rankings` rankings inner join `dfs/parquet/uservisits` uservisits on rankings.pageURL = uservisits.destinationURL;
select count(*) from v25;
drop view v25;
