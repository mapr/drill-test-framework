create or replace view v13 as select * from `dfs/parquet/rankings`;
create or replace view v13_2 as select * from `dfs/parquet/uservisits`;
select v13.pageRank, v13_2.searchWord from v13 inner join v13_2 on v13.pageURL = v13_2.destinationURL;
drop view v13;
drop view v13_2;
