select s_address, s_phone, s_acctbal
from `filter/pushdown/varchar_decimal/no_metadata_file/1.14.0/supplier`
where not s_acctbal > -900;
