select ps_availqty, ps_supplycost, ps_comment
from `filter/pushdown/varchar_decimal/no_metadata_file/partsupp_old`
where ps_supplycost > 999.9;
