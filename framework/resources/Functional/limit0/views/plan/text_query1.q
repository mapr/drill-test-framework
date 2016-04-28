create or replace view v1_text as select cast(columns[0] as int) as c1, cast(columns[1] as varchar(100)) as c2, cast(columns[2] as integer) as c3 from `dfs/text/rankings`;
explain plan for select * from (select count(*) from v1_text) t limit 0;
drop view v1_text;
