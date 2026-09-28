-- expected: NULL input -> NULL (NULL_IF_NULL)
select regexp_extract(cast(null as varchar), '([0-9]+)', 1) g from (values(1))
