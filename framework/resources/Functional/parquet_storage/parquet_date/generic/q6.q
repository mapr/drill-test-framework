select EXPR$0, l_commitdate+1, date_add(l_receiptdate, 5) from dfs.`/drill/testdata/parquet_date/lineitem_dates` where EXPR$0 > date '1998-11-10';
