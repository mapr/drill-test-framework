create or replace view v25_limit0 as select cast(rankings.pageRank as int) pageRank, cast(rankings.pageURL as varchar(100)) pageURL, cast(rankings.avgDuration as integer) avgDuration from `dfs/parquet/rankings` rankings inner join `dfs/parquet/uservisits` uservisits on rankings.pageURL = uservisits.destinationURL;
select count(*) from v25_limit0;
drop view v25_limit0;
