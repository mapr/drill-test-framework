-- AGE function
select 
	c_varchar, 
	AGE(CONVERT_FROM(c_timestamp, 'TIMESTAMP_IMPALA')) - AGE(CONVERT_FROM(c_timestamp, 'TIMESTAMP_IMPALA')) 
from 
	imp_t1 
where c_varchar like '%000000%';
