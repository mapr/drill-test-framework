-- ROUND wrapped around sum
select
     sum(c_bigint)         as sum_c_bigint,
     ROUND(sum(c_bigint/12))
 from
     alltypes_with_nulls
 group by
     c_varchar,
     c_integer,
     c_date,
     c_time,
     c_boolean
order by 1,2;
