explain plan for select * from (select cast(columns[0] as int) from `dfs/text/rankings` where cast(columns[0] as int) > 5 and cast(columns[2] as integer) > 5) t limit 0;
