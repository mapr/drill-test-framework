-- EXTRACT in predicate
select count(*) from imp_t1 where EXTRACT(year from CONVERT_FROM(c_timestamp, 'TIMESTAMP_IMPALA')) <> '2014';
