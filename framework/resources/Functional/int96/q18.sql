alter session set `store.parquet.reader.int96_as_timestamp`=true;
select 
	ROUND(EXTRACT(year from c_timestamp)), 
	count(*) 
from 
	imp_t1 
group by 
	ROUND(EXTRACT(year from c_timestamp))
order by
	1,2;
alter session set `store.parquet.reader.int96_as_timestamp`=false;
