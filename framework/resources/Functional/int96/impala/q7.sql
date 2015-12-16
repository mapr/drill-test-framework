-- extract month from timestamp
select count(*) from imp_t1 where CAST(EXTRACT(month from CONVERT_FROM(c_timestamp, 'TIMESTAMP_IMPALA')) as INT) = 3;
