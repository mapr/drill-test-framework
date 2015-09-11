-- Inner join
-- With count distinct in both having clause and projection list, columns from different tables
select
	count(*),
	count(distinct a.c_boolean)
from
	alltypes a,
	alltypes b
where
	a.c_timestamp = b.c_timestamp
having
	count(distinct b.c_date) > 0;
