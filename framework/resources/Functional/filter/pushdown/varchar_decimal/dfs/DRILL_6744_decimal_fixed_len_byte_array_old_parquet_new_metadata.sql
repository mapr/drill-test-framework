select ps_availqty, ps_supplycost, ps_comment
from `filter/pushdown/varchar_decimal/new_metadata_file/partsupp_old`
where ps_supplycost > 999.9;
