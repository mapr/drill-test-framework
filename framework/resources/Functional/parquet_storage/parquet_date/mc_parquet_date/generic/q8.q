select l_extendedprice, l_shipdate, l_commitdate from dfs.`/drill/testdata/mc_parquet_date/fixeddate_lineitem` order by l_extendedprice limit 10;
