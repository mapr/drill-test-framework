-- expected: NULL_IF_NULL handling -> any NULL arg gives NULL
select percent_change(200, cast(null as double)) a, percent_change(cast(null as double), 200) b from (values(1))
