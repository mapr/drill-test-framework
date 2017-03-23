create table dfs.tmp.t_drill4872 partition by ( x ) as select case when columns[8] = '' then cast(null as varchar(10)) else cast(columns[8] as varchar(10)) end as x FROM dfs.`/drill/testdata/tpcds_sf1/text/store_sales`;
SELECT COUNT(*) FROM dfs.tmp.t_drill4872;
DROP TABLE dfs.tmp.t_drill4872;
