create or replace view v29 as select cast(rankings.pageRank as int) pageRank, cast(rankings.pageURL as varchar(100)) pageURL, cast(uservisits.destinationURL as character varying(100)) destinationURL from `dfs/parquet/rankings` rankings inner join `dfs/parquet/uservisits` uservisits on rankings.pageURL = uservisits.destinationURL;
explain plan for select * from (select v29.pageRank, pages.url, pages.description from v29 inner join hive.pages pages on v29.pageURL = pages.url) t limit 0;
drop view v29;
