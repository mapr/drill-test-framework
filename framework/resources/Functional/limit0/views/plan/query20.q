create or replace view v20 as select cast(rankings.pageRank as int), cast(rankings.pageURL as varchar(100)), cast(rankings.avgDuration as integer), cast(uservisits.sourceIP as char(15)), cast(uservisits.destinationURL as character varying(100)), cast(uservisits.visitDate as date), cast(uservisits.adRevenue as float), cast(uservisits.userAgent as varchar(61)), cast(uservisits.countryCode as char(3)), cast(uservisits.languageCode as varchar(6)), cast(uservisits.searchWord as varchar(23)), cast(uservisits.duration as int) from `dfs/parquet/rankings` rankings inner join `dfs/parquet/uservisits` uservisits on rankings.pageURL = uservisits.destinationURL;
explain plan for select * from (select count(*) from v20) t limit 0;
drop view v20;
