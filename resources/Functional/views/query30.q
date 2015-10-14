create or replace view v30 as select rankings.pageRank, rankings.pageURL, rankings.avgDuration, uservisits.sourceip, uservisits.destinationurl, uservisits.visitdate, uservisits.adrevenue, uservisits.useragent, uservisits.countrycode, uservisits.languagecode, uservisits.searchword, uservisits.duration from `dfs/parquet/rankings/` rankings inner join hive.uservisits uservisits on rankings.pageURL = uservisits.destinationurl;
select count(*) from v30;
drop view v30;
