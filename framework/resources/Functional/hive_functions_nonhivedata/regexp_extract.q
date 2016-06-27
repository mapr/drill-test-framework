select columns[0], regexp_extract(case when columns[3]='' then null else columns[3] end, 'W(.*)nd', 1) from `customer_address.tbl`;
