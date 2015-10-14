create or replace view v23 as select * from `dfs/parquet/rankings` rankings inner join `dfs/parquet/uservisits` uservisits on rankings.pageURL = uservisits.destinationURL;
select * from v23;
drop view v23;
