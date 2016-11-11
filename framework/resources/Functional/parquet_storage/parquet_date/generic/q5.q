alter session set `store.parquet.use_new_reader` = true;
select l_shipdate from dfs.`/drill/testdata/parquet_date/dates_nodrillversion/drillgen2_lineitem` order by l_linenumber limit 100;

