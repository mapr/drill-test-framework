SELECT
stddev_samp(cast(decimal_28_4 as decimal(28, 4))) stddev_samp_func
FROM dfs.drillTestDir.`CTAS_CSV_PARQUET_DECIMAL28`
