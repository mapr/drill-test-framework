select s_address, s_phone, s_acctbal
from `filter/pushdown/varchar_decimal/no_metadata_file/supplier_old`
where not s_acctbal > -900;
