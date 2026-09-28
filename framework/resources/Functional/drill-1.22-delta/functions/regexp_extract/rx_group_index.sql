-- expected: group 2 = '456', group 0 = whole match
select regexp_extract('123-456-789', '([0-9]{3})-([0-9]{3})-([0-9]{3})', 2) g2, regexp_extract('123-456-789', '([0-9]{3})-([0-9]{3})-([0-9]{3})', 0) g0 from (values(1))
