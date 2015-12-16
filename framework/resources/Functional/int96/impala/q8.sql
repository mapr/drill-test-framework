-- q8.sql
-- EXTRACT day in predicate
select count(*) from imp_t1 where CAST(EXTRACT(day from CONVERT_FROM(c_timestamp, 'TIMESTAMP_IMPALA')) as INT) = 13;
