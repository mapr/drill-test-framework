select p_name, p_brand, p_retailprice
from `filter/pushdown/varchar_decimal/no_metadata_file/part_old`
where p_retailprice > 1900.989;
