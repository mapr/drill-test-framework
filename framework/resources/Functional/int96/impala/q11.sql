-- group by multiple columns including int96
select CONVERT_FROM(c_timestamp, 'TIMESTAMP_IMPALA'), c_integer, c_varchar, count(*) from imp_t1 group by c_timestamp, c_integer, c_varchar;
