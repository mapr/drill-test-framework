-- Inner join
-- With count distinct in both having clause and projection list, columns from different tables
-- And one more distinct aggregate from the same table
select
	count(*),
	count(distinct a.c_boolean)
from
	alltypes_v a,
	alltypes_v b
where
	a.c_timestamp = b.c_timestamp
having
	count(distinct b.c_date) > 50 or
	sum(distinct b.c_integer) > 0;
