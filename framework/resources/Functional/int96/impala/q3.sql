select count(*) from imp_t1 where CONVERT_FROM(c_timestamp, 'TIMESTAMP_IMPALA') = timestamp '2015-04-30 21:23:22';
