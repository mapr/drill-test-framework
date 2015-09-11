create or replace view v15 as select pageRank, pageURL, avgDuration from `dfs/parquet/rankings`;
create or replace view v15_2 as select sourceIP, destinationURL, visitDate, adRevenue, userAgent, countryCode, languageCode,
searchWord, duration from `dfs/parquet/uservisits`;
select count(*) from v15 inner join v15_2 on v15.pageURL = v15_2.destinationURL;
drop view v15;
drop view v15_2;
