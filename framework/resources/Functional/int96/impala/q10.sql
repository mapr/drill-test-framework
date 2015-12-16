-- aggregation: simple
select CONVERT_FROM(c_timestamp, 'TIMESTAMP_IMPALA'), count(*) from imp_t1 group by c_timestamp;
