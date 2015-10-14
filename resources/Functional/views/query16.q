create or replace view v16 as select pageRank, pageURL, avgDuration from `dfs/parquet/rankings`;
create or replace view v16_2 as select sourceIP, destinationURL, visitDate, adRevenue, userAgent, countryCode, languageCode,
searchWord, duration from `dfs/parquet/uservisits`;
select v16.avgDuration from v16 inner join v16_2 on v16.pageURL = v16_2.destinationURL;
drop view v16;
drop view v16_2;
