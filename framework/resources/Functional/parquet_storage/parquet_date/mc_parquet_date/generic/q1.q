refresh table metadata dfs.`/drill/testdata/mc_parquet_date/lineitem_dates`;
select * from dfs.`/drill/testdata/mc_parquet_date/lineitem_dates`;

select 1 from sys.version
