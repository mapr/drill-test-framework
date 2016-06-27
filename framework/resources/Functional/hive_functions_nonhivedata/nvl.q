select nvl(cast(case when columns[0]='null' then null else columns[0] end as integer), 5) from `fewtypes_null.tbl`;
