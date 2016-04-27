-- ROUND wrapped around sum
explain plan for select * from (select
     sum(cast(c_bigint as bigint))         as sum_c_bigint,
     ROUND(sum(cast(c_bigint as bigint)/12))
 from
     alltypes_with_nulls
 group by
     cast(c_varchar as varchar(10)),
     cast(c_integer as int),
     cast(c_date as date),
     cast(c_time as time),
     cast(c_boolean as boolean)
order by 1,2) t limit 0;
