refresh table metadata dfs.`/drill/testdata/mc_parquet_date/dates_nodrillversion/drillgen2_lineitem`;
select l_shipdate from dfs.`/drill/testdata/mc_parquet_date/dates_nodrillversion/drillgen2_lineitem` order by l_linenumber limit 100;
select 1 from sys.version;
