select char_length(cast(nvl(
    cast(case when columns[0] = 'null' then null
        else columns[0] end as integer)
    , 5) as varchar(3))) from `fewtypes_null.tbl`;
