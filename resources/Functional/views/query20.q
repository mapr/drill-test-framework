create or replace view v20 as select rankings.pageRank, rankings.pageURL, rankings.avgDuration, uservisits.sourceIP, uservisits.destinationURL, uservisits.visitDate, uservisits.adRevenue, uservisits.userAgent, uservisits.countryCode, uservisits.languageCode, uservisits.searchWord, uservisits.duration from `dfs/parquet/rankings` rankings inner join `dfs/parquet/uservisits` uservisits on rankings.pageURL = uservisits.destinationURL;
select count(*) from v20;
drop view v20;
