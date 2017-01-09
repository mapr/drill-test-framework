refresh table metadata dfs.`/drill/testdata/mc_parquet_date/lineitem_dates`;
select EXPR$0, l_commitdate+1, date_add(l_receiptdate, 5) from dfs.`/drill/testdata/mc_parquet_date/lineitem_dates` where EXPR$0 > date '1998-11-10';
select 1 from sys.version
