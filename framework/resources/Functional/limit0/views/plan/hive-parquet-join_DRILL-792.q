create or replace view `DRILL-792` as select cast(pageRank as int) pageRank, cast(pageURL as varchar(100)) pageURL, cast(avgDuration as integer) avgDuration from `dfs/parquet/rankings`;
explain plan for select * from (select rankings.pageRank pagerank from `DRILL-792` rankings inner join hive.uservisits uservisits on rankings.pageURL = uservisits.destinationurl) t limit 0;
drop view `DRILL-792`;
