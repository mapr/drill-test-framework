refresh table metadata dfs.`/drill/testdata/mc_parquet_date/lineitem_dates`;
select d.EXPR$0 col1_date from dfs.`/drill/testdata/mc_parquet_date/lineitem_dates` d where d.EXPR$0 > date '1998-11-10' union select cpl.l_shipdate from cp.`tpch/lineitem.parquet` cpl where cpl.l_shipdate > date '1998-11-09';
select 1 from sys.version
