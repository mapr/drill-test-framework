select round(cast(case when columns[8]='null' then null else columns[8] end as double)) from `fewtypes_null.tbl`;
