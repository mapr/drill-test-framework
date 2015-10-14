create or replace view v1_text as select columns[0] as c1, columns[1] as c2, columns[2] as c3 from `dfs/text/rankings`;
select count(*) from v1_text;
drop view v1_text;
