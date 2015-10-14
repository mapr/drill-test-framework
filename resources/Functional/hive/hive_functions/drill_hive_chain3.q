select concat(cast(locate('df', varchar_col, 5) as varchar(2)), 'hello') from dfs.`cross-sources`.`fewtypes_null.parquet`;
