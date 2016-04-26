create or replace view v15 as select cast(pageRank as int) pageRank, cast(pageURL as varchar(100)) pageURL, cast(avgDuration as integer) avgDuration from `dfs/parquet/rankings`;
create or replace view v15_2 as select cast(sourceIP as char(15)) sourceIP, cast(destinationURL as character varying(100)) destinationURL, cast(visitDate as date) visitDate, cast(adRevenue as float) adRevenue, cast(userAgent as varchar(61)) userAgent, cast(countryCode as char(3)) countryCode,cast(languageCode as varchar(6)) languageCode,cast(searchWord as varchar(23)) searchWord,cast(duration as int) duration from `dfs/parquet/uservisits`;
explain plan for select * from (select count(*) from v15 inner join v15_2 on v15.pageURL = v15_2.destinationURL) t limit 0;
drop view v15;
drop view v15_2;
