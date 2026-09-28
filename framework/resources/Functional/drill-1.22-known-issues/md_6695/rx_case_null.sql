-- expected: MD-6695 Expected: NULL for NULL input, match otherwise; no-match -> '' (Hive regexp_extract semantics used by ATS on 1.21.2)
select x, regexp_extract(CASE WHEN x = '' THEN null ELSE x END, 'W(.*)nd', 1) r from (values('Windy'),(''),('abc')) t(x)
