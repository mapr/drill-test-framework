select isnotnull(cast(case when columns[4]='null' then null else columns[4] end as timestamp)) from `fewtypes_null.tbl`;
