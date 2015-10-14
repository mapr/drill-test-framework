create or replace view v18 as select pageRank, pageURL, avgDuration from `dfs/parquet/rankings`;
create or replace view v18_2 as select sourceIP, destinationURL, visitDate, adRevenue, userAgent, countryCode, languageCode,
searchWord, duration from `dfs/parquet/uservisits`;
select * from v18 inner join v18_2 on v18.pageURL = v18_2.destinationURL;
drop view v18;
drop view v18_2;
