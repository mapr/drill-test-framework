select cast(c_timestamp as timestamp) + interval '30-11' year to month as col1 from `interval_data.parquet` where (cast(c_timestamp as timestamp) - to_timestamp('2014-02-13 17:32:33','YYYY-MM-dd HH:mm:ss') < interval '5 15:40:50' day to second);
