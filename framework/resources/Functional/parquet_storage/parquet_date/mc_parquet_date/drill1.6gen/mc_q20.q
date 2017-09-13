select distinct dt from (select date_col dt from  dfs_test.`/drill/testdata/parquet_date/metadata_cache/metadata_cache1.6_autogen/fewtypes_null_large`  where date_col is not null
union all 
select c dt from dfs_test.`/drill/testdata/parquet_date/spark_generated/d4` where c is not null
union all
select l_shipdate dt from dfs_test.`/drill/testdata/parquet_date/dates_nodrillversion/drillgen2_lineitem`
union all
select l_shipdate dt from dfs_test.`/drill/testdata/parquet_date/fixeddate_lineitem`
) data order by dt asc limit 1000;
