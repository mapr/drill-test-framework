select 
	ROUND(EXTRACT(year from CONVERT_FROM(c_timestamp, 'TIMESTAMP_IMPALA'))), 
	count(*) 
from 
	imp_t1 
group by 
	ROUND(EXTRACT(year from CONVERT_FROM(c_timestamp, 'TIMESTAMP_IMPALA')))
order by
	1,2;
