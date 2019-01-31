set `store.parquet.reader.strings_signed_min_max` = 'true';
select p_name, p_retailprice, p_comment
from `filter/pushdown/varchar_decimal/no_metadata_file/1.14.0/part`
where p_name = 'yellow white tan khaki saddle';
reset `store.parquet.reader.strings_signed_min_max`;