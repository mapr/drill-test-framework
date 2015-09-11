create or replace view v17 as select pageRank, pageURL, avgDuration from `dfs/parquet/rankings`;
create or replace view v17_2 as select sourceIP, destinationURL, visitDate, adRevenue, userAgent, countryCode, languageCode,
searchWord, duration from `dfs/parquet/uservisits`;
select v17.avgDuration, v17_2.visitDate, v17_2.userAgent from v17 inner join v17_2 on v17.pageURL = v17_2.destinationURL;
drop view v17;
drop view v17_2;
