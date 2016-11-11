refresh table metadata dfs.`/drill/testdata/mc_parquet_date/dates_nodrillversion/drillgen2_lineitem`;
alter session set `store.parquet.use_new_reader` = true;
select l_shipdate from dfs.`/drill/testdata/mc_parquet_date/dates_nodrillversion/drillgen2_lineitem` order by l_linenumber limit 100;
alter session set `store.parquet.use_new_reader` = false;

select 1 from sys.version
