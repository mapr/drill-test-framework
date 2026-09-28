-- expected: 2-arg form returns the list of capture groups (upstream TestRegexpFunctions)
select regexp_extract('123-456-789', '([0-9]{3})-([0-9]{3})-([0-9]{3})') g from (values(1))
