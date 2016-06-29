create or replace view v30_limit0_plan as select cast(rankings.pageRank as int), cast(rankings.pageURL as varchar(100)), cast(rankings.avgDuration as integer), uservisits.sourceip, uservisits.destinationurl, uservisits.visitdate, uservisits.adrevenue, uservisits.useragent, uservisits.countrycode, uservisits.languagecode, uservisits.searchword, uservisits.duration from `dfs/parquet/rankings/` rankings inner join hive.uservisits uservisits on rankings.pageURL = uservisits.destinationurl;
explain plan for select * from (select count(*) from v30_limit0_plan) t limit 0;
drop view v30_limit0_plan;
