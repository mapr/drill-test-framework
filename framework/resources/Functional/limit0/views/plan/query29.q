create or replace view v29_limit0_plan as select cast(rankings.pageRank as int) pageRank, cast(rankings.pageURL as varchar(100)) pageURL, cast(uservisits.destinationURL as character varying(100)) destinationURL from `dfs/parquet/rankings` rankings inner join `dfs/parquet/uservisits` uservisits on rankings.pageURL = uservisits.destinationURL;
explain plan for select * from (select v29_limit0_plan.pageRank, pages.url, pages.description from v29_limit0_plan inner join hive.pages pages on v29_limit0_plan.pageURL = pages.url) t limit 0;
drop view v29_limit0_plan;
