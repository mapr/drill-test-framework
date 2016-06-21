select from_utc_timestamp(case when columns[4]='null' then null else columns[4] end, 'PST') from `fewtypes_null.tbl`;
