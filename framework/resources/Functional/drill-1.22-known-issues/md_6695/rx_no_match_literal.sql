-- expected: no match -> '' ; isolates the MD-6695 root cause (output buffer unset when find() fails), no CASE/NULL involved
select regexp_extract('abc', '([0-9]+)', 1) r from (values(1))
