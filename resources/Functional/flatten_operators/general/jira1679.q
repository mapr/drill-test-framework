with tmp as (select 1 as fixedcolumn, flatten(columns) as newcol from dfs.`/drill/testdata/flatten_operators/jira1679/b.csv`) select regexp_replace(cast(tmp.newcol as VARCHAR(4)), 'a', 'b') from tmp;
